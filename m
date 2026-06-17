Return-Path: <linux-arm-msm+bounces-113535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fUWJBBZ1Mmod0QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:21:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 767516986D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:21:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=n4iN6t94;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Qi8mc0gr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113535-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113535-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5DC8F30E5B85
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ED5A3C4B93;
	Wed, 17 Jun 2026 10:17:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDB13EDE5D
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:17:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781691460; cv=none; b=MYee+wc/T8mv8Xl7RfnlkVPTBTUrgNSh/de8Y9UM7i9fd7nAOGqlkWwmS2W9lCM0GSs19BxQJY6onAZwn4r9vBq1DpZUbl71Jsw2koKZIFMR/opQvUVpSaeacbBlHZ5P4F+OfEfUDmEVAQfvoJjUWfI6FmGmLcm7/pQGqBkPXq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781691460; c=relaxed/simple;
	bh=hh4duBEop7U0dq9PZgU0+rgHBcwdHKXSP9n2Ka7n3Iw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NjbL6d/30vA+1EIGS5sNvBAcc/oWERxGhDR/76ENHjDnEu36HSqw9iObMCV15WKpSkkMnNFRl6rEtFF88CmPM3FZMq0W+RNChQ2mUPa+x5Xw6/1k3G6iR9T7BMfv6GJj2dzZeDwQM7Pv2QP8kns20v7dJ78d325f+d5ipEb7Xlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n4iN6t94; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qi8mc0gr; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UXRL2217612
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:17:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	grvGHdCDgWa9nS2neYxUgkMzjZ+xFEoJZ4xYB1NH2Io=; b=n4iN6t94Eo+IuLMc
	lhnqV8n7o+7rzsafmMABIHRywks1kNOu39kFLlA0UKLjpVjCTgWuUw6oVvL3njlr
	wFdFJKAdfLmV9eVWa+jlVG4x1jUXa7fu7BWIs5k535CJLpl+uyp3+BF9peCrCnoy
	TQxNrK/i/3uI/x303bla9XyBteAToak/Fpz4zE56J7vvMbxz6tGVy3EmzcYoS2Wf
	iN70Zm1YseCwU2weeKWv6rkVsMLfIj2G4yuPONDJFSptCuenLzyCiOMWPK0uK27u
	pRX7NhIH1IfOJbNxs50UlvQZLyUZXw33GP03WCu4Tz/6PNqRY7FhDW/RTEqFQCkS
	b0OwjQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueeran8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:17:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9160006de85so144761985a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 03:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781691452; x=1782296252; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=grvGHdCDgWa9nS2neYxUgkMzjZ+xFEoJZ4xYB1NH2Io=;
        b=Qi8mc0grqIuylyK4/x2v7qYVHojs+i7KC/CeEygplxsp0UZMqWNlWw2e2IbWvJPAQ7
         iWUYhjOP1Ip/3lyRU8MP9lhkSNYTSdtSnPl45TgiteotGMWzQ79LyItGeedMENu2o4ah
         +tqncQZ0Vxe8mPA4sRm+uoyrLm91wOPjfRUbjPRciNmOeCcfZycimngLIcIpI2h5L6xP
         Q0rkYSUDRmzYJIvGCQNTFTHJ05eKQGr3fWz5IlEdW+hFaY5yYMRgRIcvCjbJPGw9mrS1
         Ry0x9VcHOh0jeMOaeOGCifTSkXbb7mwfX7nmCZDil/fNX9sBkgzvjHSKjjRAa7B9Ux22
         L4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781691452; x=1782296252;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=grvGHdCDgWa9nS2neYxUgkMzjZ+xFEoJZ4xYB1NH2Io=;
        b=sst4W8ZUjlh4HzRTiuUeAw698jsBOIm17/IXTIZSSirNvIZ6p2/ZviGmmMAyiH7QiK
         9x/BdbpcxsmQ2bJGa+wKKcpkk9DzJYUd+LOXMFv41H8l4jL4cpwIS4Low8PAFKlEwhup
         hnkzGJlEdtWYWJGj2LbafbyT8gxvoyMOQtRs7BrhsoeOM82iSr4He2S4JHXH/L/gAzV+
         oI0UfOROy00ajpBeZy+CuolFgHC8QjNfYhq3Lgl1XYvjurd2JSwnCybsn1PsKlAOBdLr
         guRN+z4Uz7IdeCezh3NnWdnqPAA+MSWIp2kvOtkqn+Y4ICuESI+cQxjw5jO7ctWxjLUv
         0Uow==
X-Gm-Message-State: AOJu0YxAjFZmiGRJ6tZoXcJvo/9OTneDL/Wd3WeQMDSh6G2n70pQc1jt
	50X+e2JUf2AFDoPY27pOrRercj5IbMXViy+CzGWIj9bWjoVhjFJCfbTphW2RlwFN69FCtlBecYN
	/6XyOacPH7WGhtIuTSDhxKOhoQzsPaOklC7tfN5a9L+0RrA0SRpECWLEwCSQc5EWDXDE+
X-Gm-Gg: Acq92OHFWILB/BYDRytlS6qoDBB922O7Jc4ohw6Yns78qAHX+RSyQevXlhT5iPg6avu
	Z20MLqPDG6LtUpLuXrl1ZIBTMgx0ajJ2FRzumlt21jGEyFEj1ZUyerCnwDVtPl6UpN9QpGCNT/J
	uH/Qa+SAzirFvUxJvB/GkEtzAcJ+FtQ61+WuIZzXjkH+12shtfXnRdES5JaPQTisZPqgA4vwFz7
	4CJajZonwbqupmH4LRTIbab/5rrWe3LiJZU/g+GD4P3wwSxYO0ev8/qcOxxwSFpvepYBXSxg9PD
	YSAPVvudU0hQoq26zlIund09yftNuO7e7M07PDj5OCv3MonFGNqaLdVHHpYnvAPSplrbfOZZLpB
	51dtPdYMEo7CiNtRm12vHpfG1i9wjkM02g84=
X-Received: by 2002:a05:620a:2951:b0:911:295d:59a1 with SMTP id af79cd13be357-91d8c2b49edmr324407685a.8.1781691452287;
        Wed, 17 Jun 2026 03:17:32 -0700 (PDT)
X-Received: by 2002:a05:620a:2951:b0:911:295d:59a1 with SMTP id af79cd13be357-91d8c2b49edmr324405285a.8.1781691451845;
        Wed, 17 Jun 2026 03:17:31 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c018eab36c4sm516643566b.50.2026.06.17.03.17.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 03:17:31 -0700 (PDT)
Message-ID: <e6aa773c-daa2-43d4-ac56-4a26c58a3910@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 12:17:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/3] arm64: dts: qcom: monaco: Move eMMC CQE support
 from SoC to board DT
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>
References: <20260616130347.3096034-1-monish.chunara@oss.qualcomm.com>
 <20260616130347.3096034-2-monish.chunara@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616130347.3096034-2-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA5NiBTYWx0ZWRfX/NFrtbN5CaTi
 K7Iy3bWRfCWkBQInOWkavP36odqBMFUyx8yJjMunquQ3X2+kNtlInLRIwssRcPila3vuvRM2/QN
 rdq0oL5yXzS+NnXBkfe2/dDczS+7mb8=
X-Proofpoint-GUID: Wk2_ZKcRIuee_WzPKy9QlPVm8L_q_Osv
X-Authority-Analysis: v=2.4 cv=d4fFDxjE c=1 sm=1 tr=0 ts=6a32743c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=foJT35fSmds2pDCHF_0A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA5NiBTYWx0ZWRfX7U3tTO01R2cb
 W2gFcsMDRrqJaGBlertowYfjO2rU/iUes0slv6N3x/JGvjN5kGmPw5uMNlewTol/rtPW2lbL9qn
 HoRgoEArDJ+y/TIjOMyjOC32QTwm3bKzKQYTa6twOEx1jMjBjsx0vJrnTirY6aMr0V6R9dBnEFR
 HtCsiLGU7ILOr2zfUliuTX+LmYth1nDjoNQ0w3cZVBZoYTbRWNnFwqB63zh+CjPCgFkvzrBNPg8
 823B/NIMOK+8WAacLqHHnUElyJ3ksTmTBoq2MZadqBjJj7cWOI4zeJ+qOhzPywuwpNTDxPvVCx3
 wasjymTsDH4eaSIBNfGYSTFbwrv7rZV2wYM+YQC2OP8gcCirD9bJVLfJOPeCeUVo2M4cPKEcj7C
 BSUbtesW57UmY0fAC7LitjNyjIJSvggRmhhlrLSUpn9Zt4UWoubyE3K25TBtT8JkITbymHLb3d9
 sm65qpvKGHHLtU5jIxQ==
X-Proofpoint-ORIG-GUID: Wk2_ZKcRIuee_WzPKy9QlPVm8L_q_Osv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170096
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113535-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:monish.chunara@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mani@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sarthak.garg@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:nitin.rawat@oss.qualcomm.com,m:shiraz.hashim@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 767516986D5

On 6/16/26 3:03 PM, Monish Chunara wrote:
> The Monaco SoC SDHC controller supports both eMMC and SD cards. However,
> the 'supports-cqe' property (Command Queue Engine) is specific to eMMC
> and conflicts with SD card operation.
> 
> Remove 'supports-cqe' from the SoC device tree to ensure compatibility
> with SD cards. Simultaneously, add the property explicitly to the
> qcs8300-ride board device tree, as this board uses the controller in
> eMMC mode.
> 
> This ensures the SoC definition remains generic while enabling features
> correctly at the board level.
> 
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco.dtsi      | 1 -
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 1 +

Please also fix up monaco-monza-som.dtsi

Konrad

