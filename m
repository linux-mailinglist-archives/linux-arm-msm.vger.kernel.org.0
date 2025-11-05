Return-Path: <linux-arm-msm+bounces-80494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D12ABC383DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 23:47:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4817188C6CE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 22:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11BC72F3C3E;
	Wed,  5 Nov 2025 22:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="noKnkKvP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="erg4OWiq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1212F39D7
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 22:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762382697; cv=none; b=JZwxG44FkZFh5XAqowZ92ErMfRNarX4y8xRsxwaj5mdGDtQhGGsRN/DQCb2hdNaxs31nPUnkn7W8pLO05XjNo2wZwR80wJT8nFZWzVJcaE0Ee9uWfdABrvH099FzypH07+NJVbCeHYIkunB0j6to1wSZ7PaYFnYXcUe9U+By8Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762382697; c=relaxed/simple;
	bh=usQTwLS6aq3xIb53ehveSVahSsSC+hkbNA1TG650ZvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dighttRgi57I+rwPJ7B+wsVgBMHE+dctQKb36tiK9y9EW0XUnrARsTXo7CT+0oechGoJw9HqE1eETXqbGogWZOsAjA3RLJ/yOMAfz2b0H2CyLWSdUnHtyVJAQFaq1nE3+njwDi95gvVegMmD+eupefsCOoj0jemzs/daEsLx7Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=noKnkKvP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=erg4OWiq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5KFUpo1726803
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Nov 2025 22:44:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	whD4rrMgKz5k0TcFiUB0yPuwca0R24xTiXw3wTTUxh0=; b=noKnkKvPYm73TfDx
	2p+zQ3ymkDzm/vdVNJWCHMX32ORuTKpxjIDwkgwdxN8Zc7d83WUbIpmxfU8Vp7Iv
	d3uI6phgxxF+cpjAEfx9SyitpyLM5O71jfCkx3rnbu+vZSxm8MUOj452D7/mSDZC
	N3jPnebuLgkURUDS5iXCfqtWsG62gvBg5i+thAiIKH7NPwhoSQDCgBszTONI+w1h
	hae/quhe3gUTd8o9AtRlQDkJmxzNe8fJ2dYaluQHk4r3japtwbPsQe+tbwuq+Alw
	YRUltC/UVhz+ApVpY3yIGmlaMEHG2advE5TV2jDcibrimF9J8EjKLbjAgJykpfRb
	6PdzRg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a82mt2g3v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 22:44:54 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-340be2e9c4bso352927a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 14:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762382694; x=1762987494; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=whD4rrMgKz5k0TcFiUB0yPuwca0R24xTiXw3wTTUxh0=;
        b=erg4OWiqEgGL6hhrMBydZSDgcwxVgMmV8vkhnAx6b4z5oCxpQ3ErVWHEgzoVjcmeNo
         t8SnSPDs8jqHivQ6dZV3SZQevF2bBSi3GjwGIZ31gccxTELRiOrlGCVPRbCiCRWyNmVI
         XJtaJ2SS88Chz8smnBuqxPv12YGOaaJ2N/vwgZcwKgsU0fP7oy496M6sey0UYt2p5WKX
         6gnq7Ikx5scPWhw9y1KSGrynCwDIN0Vu/BUV96Uhg071fxemhMGdIYdfNSGhflIOgyLS
         nZwZnO3lSgb73E097aKiiMssXwIbFFYyXiACjQDawIaEOK+f+/sDAT9qjcoOXX3NEvC4
         F86Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762382694; x=1762987494;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=whD4rrMgKz5k0TcFiUB0yPuwca0R24xTiXw3wTTUxh0=;
        b=JnNAF50lmC29mxLFT435nGiDksj6wRyw+gDYpZuQCS+ISfvTgYXi/F8TKnO+3S1FyJ
         PPu7vnZoBfiUcvfUo0TxBgixZMUMBa0S0kEnDRgFEAJPv+wn3+lnZxXdKx+qdksYADCb
         ra6h3W2/uZKVmD7w1bq+vcVT5lKh4RnAY1c7Kqvwn7HAljjEa87T/i1R/AVZh39aNi3i
         TqgfDqRMSUngxOLx/VIzoWjGEKC0IvB/ybgwKSb0KrxncfgarAX+33ir04sG5WUuW7li
         BQDMRn+SWuzZ/rXZVrzxQVLy+gZIrx7BELzxq4cX8zBEgB7iDoCErbwAt5I1Q9c7er6W
         auUA==
X-Forwarded-Encrypted: i=1; AJvYcCXWWO/1RBXOg9E6jye1aKAmgVdrP21QToqSQ+sODkrFAfvb8QywdeWM1jFbqau/ajz0DlUXh8+QA5R8Hxiv@vger.kernel.org
X-Gm-Message-State: AOJu0YwxeyMdsJaaYKyy15t/fNfu+GrBHF02fg90W96hOq4IlDwxVgv3
	PHERvfCnLBTtd8dXwQnCa/5uc3BcFxwnx9mJgKDaLIpeO7hlzmqc0hL47Cg3sQ8nbNrzHHqzECn
	ADbpqfgwA17Td886z+9nj34hMXfL+SItrlL9I8AeHQC8aUR1NkvQ3uads8qetUNfAb+Fm
X-Gm-Gg: ASbGncvAeNyRJFilJfk0iLvgXTfPqikK7MeukSZpuyZhERlFhEHU5oOFTcU7PoqFWEY
	Ts72wyFCBPeBFdJKpFC6g6yR4W7BfIXajF6yObQ5Ahf8hLSUZBZW5jPRd0rOiP7eiZ5kq1oSnRI
	sppJzugL5sw264xgcHXZZH8t1eE9OCeW7T0A0a8x+rSThl/DYl0USX2lVrGC95WOXB/HbSUgUSf
	uQJYgV8fWHJRbtZvgQ7qK6FB2Z/oxdzZIhz9dXvSZp+F05NfZDHNacz/pWxZUJBhOwbfOc8xV09
	Vl1WhP0dtWGDcgrUxPWVML8bXYC3Yy8RBIxp7rdmBLDr3oJpc//62eyl247hLMOhN2W2Ba/7YG2
	f3K7jQsKDqQIZZNbgL0nGh7qrsZnDou/fGAu28aBopszgWjKH/7RI
X-Received: by 2002:a17:90b:3c11:b0:341:2150:4856 with SMTP id 98e67ed59e1d1-341a6dd9a57mr6345349a91.17.1762382694099;
        Wed, 05 Nov 2025 14:44:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE63ghWY/re3DtQ0T2wbxh0aL5eHg3L3Lyoqu7VW2Z0ndWUR4MkwlpZJaYlnH/MyBsNXJwQYw==
X-Received: by 2002:a17:90b:3c11:b0:341:2150:4856 with SMTP id 98e67ed59e1d1-341a6dd9a57mr6345322a91.17.1762382693613;
        Wed, 05 Nov 2025 14:44:53 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a68ce9e9sm3896933a91.9.2025.11.05.14.44.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 14:44:53 -0800 (PST)
Message-ID: <803ec0f2-31f5-443b-af3b-0ebae776d864@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 15:44:51 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] accel/qaic: Add support for PM callbacks
To: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        youssef.abdulrahman@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        andersson.kernel@gmail.com
References: <20251029181808.1216466-1-zachary.mckevitt@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251029181808.1216466-1-zachary.mckevitt@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDE3OSBTYWx0ZWRfX2nKfWW4wVAWQ
 5QuC2ntNkOKjbAkjIjcgRD/JmNCsPhZxT9/pOOPWai+tPPX+jAWKK/vGpyn4vUP4Jufc8gq9dpB
 uEBlnn25SPGctEHsRfiMZROy0NnhSzAWcOj0pYdOPU7UhjNByF3Vxko4zlaaFXD4KqrXz0qosCF
 at619B/3J+HZU3c43Ll0WQmVeYNms7zFBoew28aCAmGuir9/pamZdzaTG7p6cXLziLb0LiNVF0p
 M5/h7x/3NnPpTu8Sd4cdiKsdGzFMuARqUNNNq9065d3KMKkYLGkiQtaNTh0fopVtJ6fOE/FzwOw
 Ul+1VBObQUwx+yq6OvJBy9cWRWBzP4rXRl0/mUKvDhnMOMwWvQTf3M7fwtD7KY2eVqwEab8wORg
 ycVy+4KD6DeCYXRstKlycKH+COCk4A==
X-Proofpoint-GUID: jldtJAKYo7ej3DQQjC4N5nJMdJ2oyxEm
X-Authority-Analysis: v=2.4 cv=LLtrgZW9 c=1 sm=1 tr=0 ts=690bd366 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8xjd3bi9v8xYZN13gnkA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: jldtJAKYo7ej3DQQjC4N5nJMdJ2oyxEm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_08,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511050179

On 10/29/2025 12:18 PM, Zack McKevitt wrote:
> From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> 
> Add initial support for suspend and hibernation PM callbacks to QAIC.
> The device can be suspended any time in which the data path is not
> busy as queued I/O operations are lost on suspension and cannot be
> resumed after suspend.
> 
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> Reviewed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
> Signed-off-by: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>

Pushed to drm-misc-next

-Jeff

