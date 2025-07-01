Return-Path: <linux-arm-msm+bounces-63187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D830AEF511
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 12:28:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7A6C1BC61CF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 10:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15A31270541;
	Tue,  1 Jul 2025 10:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gg9ow7Fv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9093513AA53
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 10:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751365708; cv=none; b=rbH6Pq6OI2qzK5aN+3XcNsxe5IR/Cnu/kz6A90zVOSSsbNdNpDqOZO+g60F7vqi5lqWgd/RhhEhSUGtH3hnW3OcdzThzWzJyxBDejyOOUpQmxmqe85p1PY9YfAmYG7HXLu1iiprszPiYoKL04qEWlQueZyzfEiwfMCPsM4LMaL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751365708; c=relaxed/simple;
	bh=f2XWGKiM7b+TGOOPspJgljAJ4yzKonLygpgJj4Akdnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ivvQTmgNCj2aYIs3HPaNF0Fbvjaex03e2daQLbslJmJzi6QPZYZFmJTLkuAJzRt2fax5BECygcOjYrM9r8DYfH1bc8ayAtXyh1/wN/k1gEaknwndQK4KI/LLdJaUXwvBb/YFB6Dv8HfXo1ljKZ8ymmoTceA6ZvirR2ooanOm7JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gg9ow7Fv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5619ifKe008172
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Jul 2025 10:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ahl3B/k08YR6OfktkmU35JzJSNtv/TiPDQMy/Jz+Kco=; b=gg9ow7FvvFziifqu
	Rxc4zZKMeityJWr+ycQEwY/rRlAsUdikMsURW7fiiVy7U0K32hrLkhQ9ggIxWEVL
	s72oZQeaEN577VLQbERnu44izeC8fAlq9fckpeXuPd9hTREVjscl9CDN1N5QVcA6
	FWwVzNz5Kjg90tavHzHyu3R1Xkxun9D4j9EhvLTD4KckXIihBSzORkgpm5B9n5dI
	guZ+sH+W/qtsdYWfBxqagwCGMlyFRk9gu1RhwTXc+DMHFIoxZF2EdhBzkiZVMMkA
	G3RLwRauPDVNaevq8EWuqYzBjmOn+YYd33qTAQXWaQBS/HAMeZtoLyZPlcUkGcgk
	/FWSBw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kkfmw4b1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 10:28:24 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fd202ecf82so10136386d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 03:28:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751365703; x=1751970503;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ahl3B/k08YR6OfktkmU35JzJSNtv/TiPDQMy/Jz+Kco=;
        b=YemInxgF12Gs/4iFGkzPo02JN24HCK7RrLubbLE3fGEdzpxy1x2cXUEsHMV3mc7Bwa
         F/N6xtkIkAOc89uT5jENwu7avbQEuHFv9AvcT0TeJAd6q1EFBnPL23pvpVln5m7ib5GH
         S7ozIu59b2a5iKY5ZOcQG38bo3GPRNWaP4+bj+xvP+PhEB7yGnKeL54lHRR+kiFY8IcR
         GWCNU1PpY59Sz2RLrxIXvPtamZ/VB/N/HUJZ42sTskXRo1vlnlo3Zrn3HbR+SIm864lF
         1nMHvX1m+mJPqLTQah2MkxuB8dUKYDrrpMU/Qbhp7sU+KZM8XaVHfhlY7xFnQObLincC
         lJdA==
X-Gm-Message-State: AOJu0YwHYxtyrLbsD0FiCc+AVuMAjgOyEcyueEsF4yq+ZhQ4NkVrcidB
	llwGXbJVhwGyR5idZ7pHYHHSQe9uroGY6hK31CNgbqxuXwALYeQKAMOxmw3v/h2MB9lsMrwofZ6
	yhu6w5Gb2ASXBx0wN0arrEpKqzR4rtGCVkWubE77G7zq+JosLRygLn9OCqA5F/pFn4Wr5
X-Gm-Gg: ASbGnctAuWC8OLVw+RH+VMfK7VO3EndRUTU9QS8FoM0UsZE+WmCTBkjbuZNbg3ZV38/
	rJWv2yVHlDkV7iz6L7xaw3bJ262XXAazjfDkdgip5Vf76O2TUzSE/7F+poVuZARSkmW3fIDtsof
	7QRZNzIJ9p4mB8AjkUrB/70VKcdsupc9UYeGWpbFzFiLiyBr9DdxQniJNizVDGF5on53VwGQAJH
	TLeZoPY7tS5Fr8W3mrj9zccuqY4RawwAfdrr5ypCRWVn31TSFDyT+tsF7Gd1K3qGDIELUN1UiGu
	oUBKkV08+IZgAISR1XK3H6uPfn2UIGLlp0TgEZqkmSwr8jUdLsZy3fgK79XbDB0m4KM5UrEO2fB
	45A91dM6l
X-Received: by 2002:a05:6214:1cc3:b0:6fa:ed8e:372c with SMTP id 6a1803df08f44-7010bc9deb3mr13521756d6.1.1751365703536;
        Tue, 01 Jul 2025 03:28:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0w75dWyDaxWtTa/al20E0z24mhzbw2+kJ2JCM/1dBoXrMVhR6R9EFXx+tAfk5goL1sGyTXQ==
X-Received: by 2002:a05:6214:1cc3:b0:6fa:ed8e:372c with SMTP id 6a1803df08f44-7010bc9deb3mr13521546d6.1.1751365702986;
        Tue, 01 Jul 2025 03:28:22 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c828bb60fsm7327077a12.3.2025.07.01.03.28.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 03:28:22 -0700 (PDT)
Message-ID: <c0fa0222-6d45-42e2-8dfd-8160cf0cceb6@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 12:28:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq9574-rdp433: remove unused
 'sdc-default-state'
To: Gabor Juhos <j4g8y7@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250701-rdp433-remove-sdc-state-v1-1-ca0f156a42d5@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250701-rdp433-remove-sdc-state-v1-1-ca0f156a42d5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1SU5G9yDx3Se1zeYRY-d_JZjiKMA9wPa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA2MyBTYWx0ZWRfX+6QwcGAGrfLT
 hCwGnGwIqH6YTh65Wl8FcycBgiLjr7MTP0j6VahR/4T9o34oAKK4AAk4C4XhAhoCN14BrajKvG7
 PvLMi8cVZvT++HFc3vfh6FihwktNbwRTFxlmUh4DgEy0kZWHutC8Ffxo7LduVREQ/c5DXnOLId7
 q/sWRydcn5e/yzjZ4+jjDwTlWETPqHPaoX8N46dpwUOC9a8OgVfVczfxGloXKKPG+oPjKQTavAg
 1f8E/jmD3ZSRNjpMdo4WE6AUclxtmbzzk7cCelEu+E41TT8O2+lzGbVpQcvDeoPsXUTAMBxnAEH
 Viu64Gjwtyxj5mbbWjLV0+3jO28NPiafSpH4TurFmvxZ2ci9ACWvzxdX5lmssJY9SLrkelvIz9t
 qmOXSU77can+Zc6tpkAZrpeFdijskXVxHmuKekOMOzNRTfWV+YdrqUDnZ0IuA1H28J/ukG9k
X-Authority-Analysis: v=2.4 cv=L9sdQ/T8 c=1 sm=1 tr=0 ts=6863b848 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=usr-Xeseo6RQML_XfW0A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: 1SU5G9yDx3Se1zeYRY-d_JZjiKMA9wPa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=870
 bulkscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010063



On 01-Jul-25 12:10, Gabor Juhos wrote:
> Since commit 8140d10568a8 ("arm64: dts: qcom: ipq9574: Remove eMMC node"),
> the 'sdc-default-state' pinctrl state is not used so remove that.
> 
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

