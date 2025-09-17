Return-Path: <linux-arm-msm+bounces-73936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 54660B7FA03
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 15:57:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E22E9189C85F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 13:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8332A333A8C;
	Wed, 17 Sep 2025 13:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bgU2OpVS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8DA333AAD
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758116759; cv=none; b=adTGYYhyxDc7IvJFAfFL95UjM7LH9Jzsr5MhdNHqzBZ64kZXmr6LFx097goEkiC+lS5QZQ4hz11pSC7XNno97IvuLZB+4+O5I1C8Jup/KAqBO3SOtt4GXBMjRj22wGUhB8iD9jnIzXB4Z/cDU6fXeDmFUrE0XwDQJwbbn8Ce6QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758116759; c=relaxed/simple;
	bh=zE4COWFd4PeLhXg5vg78aNdA5WS5JeobBL9xaDYIXUo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rulc13N8SFfcSQx80SgAV+V7xp1yoHJzhgr3t1+8A5K2qiRCR5vdphXlsDQEHOpQQhn//AZA4W9UkIxBTVXAJyyyKGig53OCangPg9oQ16znCY1VeqLbwKfgV72pdH4GjbgwvNCxzHUAUGPl8hXychj9qdnkfSaIEsuJ8qFL0Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bgU2OpVS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H8XYPV019523
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:45:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P21xIuI10yUBLOVyIRJ8t+l+eOXwhbc5+qIAnLXXNLs=; b=bgU2OpVSyUJBD3BD
	4WPnB7ge2kafJZ1YpPLLevKHcU77nisprbJ3nLf3kIbrdoDjl1lSwu+zai9+96Te
	O2tsOL6ZR9y2ehX0Z2FA0nWfE0pSUiZuYife/2K4P6+5j47IjSibeu8lIhS9h3P5
	pTfT8b2K5VLQpFtVqnjEoErPd7wIoAhjwnc7+uXmYfQOa/e+hIqqy6Ui/3GXH0yM
	ThIMF5Gq4D+8KwoALFqVcyq9fCrFzoomn41T/IXmReSY7HXsLftMF4Hs9Lu4ujZ7
	BrYm0ohce8dxWHF6zhA6jspOuqD2UI3hyQGpvzXdrskD8tHZeRoZnc1CfvQYcVpi
	EKo1tQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy1tjay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 13:45:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b79aa110d7so7751291cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 06:45:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758116756; x=1758721556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P21xIuI10yUBLOVyIRJ8t+l+eOXwhbc5+qIAnLXXNLs=;
        b=TfFumYmrxA5sTWsooZpxGWRAFeIn0z1TTUdU606aPwJvhIFZSzYPkaIZK9WIVrNsus
         /TptmclO14LNDwYqouY0UI+e7vA3PVvEXCaxHiV62IKMcjlOyXx8VUAzHwu0hNPAtKyP
         +oa17felt6YreouSALBQqe7ayu1dWRqdy79mctYcNQ2+AebsFmpX7o3R66TxWnlaeWBa
         8Na2TrkhpM5l2sYuSKCr/FNVo/QcptiClcdeNsQjP2c164KS0KwKrgZ2XYsoWpO3gFsl
         UfLVUjxP9OY3nxwtuZPbYfclT4ul4GJaCOzT/96K5TsmgLFSiISV7A1CQNYk9dHCo1Ls
         vk4Q==
X-Gm-Message-State: AOJu0YwTl3KIUsCO43+lwuBlp3EsedPaaVTWXBKA5CARN4vXCcga+2sr
	I6QnwIb0cODkrL7vyVgKkF/tOksx10iurxqVH0h37bBaeXeJJ+R/tB7Y+84cf1bPSgf3OWJa6al
	WJC0tulK73dDzAmmLQlsjxQZwI2Suvo4kRbI4X+X6wc1YTtwpw4BZC4CAVpatGZ05Ybp8
X-Gm-Gg: ASbGncvyfDCxLvIEQ5G6StKiP+gfSckKfdOHAw2Jrym27JBuLqhuvR2EIBzoTLLgUBt
	+W3IEdmgt1Egk2wstl0pFyG/a1chUFBOnddq3ZOnvPRTNpeKDpVWkaJamNwY68TkVlnnCE3CQt4
	t5uGeA9ZjnXkXef43plDd5/J00FHl5j+OYZLpILQMwlEiJDuEaxXH8s84rVCqtqBWqp2j8yY/9J
	444PPjDdFSDEu4OsW38DG274qatBw91wb8EtcnUytIx7x7rf+DHT/zp31gUcfA1VB1K66eYZeMC
	5puQE5U9ZM9Hf/D+o+5h/tkxUmTJY4KUCrTnj4IrGwgsR1vCZ9HbbgmxnT+dsV5qFW2+Nd0hCZH
	4YcnTo3PV95+GNs40SMTp4A==
X-Received: by 2002:ac8:5dc7:0:b0:4b7:aa56:c0f8 with SMTP id d75a77b69052e-4ba66a30247mr17249731cf.4.1758116755767;
        Wed, 17 Sep 2025 06:45:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErNYH+JoLm17xNJUN8Ky2dbJ8QLxCLgtdEnNFK7p2G/gtB9/n2aKNVZmhfC+5+y8ZgpWMY5A==
X-Received: by 2002:ac8:5dc7:0:b0:4b7:aa56:c0f8 with SMTP id d75a77b69052e-4ba66a30247mr17249441cf.4.1758116755132;
        Wed, 17 Sep 2025 06:45:55 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0cf2112639sm779028866b.104.2025.09.17.06.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 06:45:54 -0700 (PDT)
Message-ID: <9d64f6cc-22b3-41ee-ab1e-d6e571562b5d@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 15:45:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/13] arm64: dts: qcom: sdm845-lg-common: Add camera
 flash
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
References: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
 <20250916-judyln-dts-v2-10-5e16e60263af@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250916-judyln-dts-v2-10-5e16e60263af@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: N88HZOKRH1Qqv6KoHf5nIg0qNb6xB95F
X-Proofpoint-ORIG-GUID: N88HZOKRH1Qqv6KoHf5nIg0qNb6xB95F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX0fBirBQjUyTe
 zNpjg2+aGgXjgECgmLouo5qqShC9EJGO8wxztGGrwMQH2EQFtyvHfHJwAYSXKPE8a+GvtNgd+wV
 VEN7sVT+54Kjb8AwgD6GLvAIPmKpFxcq8JaammkFmklJNrRYjnJfY++TCaQ9iLugNZ8LVxHRNgm
 1jicxGkqFCqVugja6oim2gFpI2gjOAP6/XZlBfPZ/mf/S9AKNR88firwvWXKYOtteNPYbpDPva4
 9Gg8OWT/k1gTrYkm0LbzRvmxrbdCLWFZ+SfJns4YMhEo63/+eCk41hc2TCL9MEzqBX6kq8k3UQ7
 YZ9Esj0dcXQqw2AhQwf8c27mnjZRq1x3rCk5D9Gsj6qgagBhRR27N3dxBX7V3nbxJoDIh7mF1Dr
 v04ePJId
X-Authority-Analysis: v=2.4 cv=cf7SrmDM c=1 sm=1 tr=0 ts=68cabb94 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8
 a=gtE8S8QUnRp0gXVXfVUA:9 a=QEXdDO2ut3YA:10 a=IQdlk4_VRkkA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

On 9/17/25 3:09 AM, Paul Sajna wrote:
> So it can be used as a flashlight
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

