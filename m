Return-Path: <linux-arm-msm+bounces-96627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IPrK9gFsGlregIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 12:51:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C7C24BB17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 12:51:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C69EE310A798
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19712389DE8;
	Tue, 10 Mar 2026 11:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CUseJ1yB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i9MqFv1x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E15A36C580
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773143250; cv=none; b=Kw3uOu9d4kWmtImhaX1I3Mgwv7WRnoqVwrnZHpnyJc0BwXJNsBiZfdp9JpsOFxjOCRnHvlOPs5/te6Vm/GI1uZKQm7ixqo+912nigWzj6mEF/Dpv/S+ecqFlX+hQ1VRpmyYDSBiZYe4LORhSwtU27psy4pbwfeoGowwbRXRRl7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773143250; c=relaxed/simple;
	bh=3TzIzozpkkcPshRim4uY3bWDxbMPNuyIhaHT6FqqG8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PIH5SpHzVTRq2vM6OnyS5Ng7qnRwSqtVz5s3F8jCNFxKDnjHqE6MJZ3+gkrZ5rDeuiIE6udf/smqoaq055Oi4LCn80gXaS9A2lSLvqUPqflIBHYxai4ZCSklH68TJY/f7n1UBATuBKZvzca0VJXU677PasRuPiB+kx/UZzkbGdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CUseJ1yB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i9MqFv1x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A9Aa5v3754828
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fLjziEkCWvVYAwCSbEhEhM5xOOiTSe9RlV+ZJVYKifA=; b=CUseJ1yByI5+Aoey
	LjcA5dfs2eht1ShkEXB+Uac+WWZaO/p03r538dllkERYLmwmnB8iQ+x/bNhiUAL3
	FLgKg/y7/IeFRoiSRC22X1SMWIvKTVy18v7PSIsY1GXFum69Nl4cFqEaO1Mp/tHh
	T0+jCpfhxV1ZUtbptrqmuCLbEttXAFz8XW/b+sIjrd7kk4/wPSVkW+GaIIZZ9ybl
	QYhf946WZlv1q/3U2ejfGh5ocVmeM8F8Rly49lXM7C6oWMkP6h1pDMx1fUjhslpX
	KwMpoZEwUHhgN2jDwXr2C+rjkJfvZL+/bMJUj3ehDQc8gZxczj/FYqj3WTNjcRYg
	KsZBRw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct477k0w0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:47:26 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-899fcb63705so45486006d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773143246; x=1773748046; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fLjziEkCWvVYAwCSbEhEhM5xOOiTSe9RlV+ZJVYKifA=;
        b=i9MqFv1xBipG1sLv5ljvXxNCwGPdEf2ZteFVnk3aBO2Qhc2qcMBgo4sNG8IV39cAES
         AZFuDzrfSn7v31qbXhCJqTioFnupNZBlE2ry8qBArEB0nXvHsdY7d7KF83YbrnKoEjtC
         46BCIr7L0Hr7qhrlsZcIq/Im2USnWNC8dZx/0kZGsaVz6TH1ZlnZox0WGLZGV8A3vnYz
         jR2H0Hxy2/GyAzOZJb0xe5rhEvNeQHMa+DCXVVXf9DdGiHNAxbovSyUyUp378A9dEkup
         oWqzbHItny7QWVzY+cpv9ZPpjWGTZ5XAiWq4aryygAHywFhVl7xEbGB0XZ6MnOa2FkvH
         GsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773143246; x=1773748046;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fLjziEkCWvVYAwCSbEhEhM5xOOiTSe9RlV+ZJVYKifA=;
        b=F6eQyjX64ptalE8O9ndf0Ee+VNIjJJkGHChCUOFg6YcSsnD88Lzyk9sPDb3bMaD9Ij
         vRLcMMJRq1RicTXkU0Wdz4gskMtbzb5u/E+oEGQrlyxdhezVFgXybmPmZExLAGOm7b3T
         BUWz28840IVOwVEnVZruizFlEAHa6ysh/asyAShLADB74u9YePh2m6Q/igcULndou48Q
         39fdZBZyhdnHUTfbUCwCnuFReaDIIXXaKsygz+mtg/oO/wgNpfkla4JCLVxHRCYnaIhw
         cu6ohCbqhMe3CGI2lKZRLNH2CQvgA6dA787bTOzOFUBsxT89DzXzNeid/KNRHSnnYkG7
         +H8g==
X-Forwarded-Encrypted: i=1; AJvYcCV1Ecy4AsaG3iG/QQIc7p06wTToj1Qg8IGftmeSWQB/+Z/crhAFeEnQriilmaw88Tpwsb1qK7z6fvqLQG7X@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7gZpLGxu2+TcU0mSS03jnmCQtgngSA+xeC5gPXPEAJ+FPHJ1v
	C+jQIDg6g2Cp1rKtyH5wlynIvMDnFnltHdfPuVdeuWI8+kYHBimJH6t8vCFIPe6mQV/KEss/Ds4
	xk0y3VRMATKzGnd3z532CYyg/jsU2g/VF3t7DmeeTKcYjnR8b9mUBP6xm+wnOLNgzSKa8
X-Gm-Gg: ATEYQzxUNb4TfQpWlohjWBJ4STEOwyOaRoWhBjPURQt0bU0kPYpUpoE4WFO8yEdB95q
	kz2owqKikdYKTGT+mbc8hUniPpSdN0lq1cy9NFq5yyUn0XdeXJqaAIj/aC+tE6PP0+6jZKwO+se
	SUgrCDCYX1jjwgy7ZtWfHQf01W3IGGHyAem86hZ6ca5B/o7bkkQ0vJrgUg6yM2l9doTZpQTwaZ2
	/KG5/JDRCd3IdU9bG2tNtRT9Z1DylVBYBydhbyygpVs9x4N7r3V8SRP4rSGoX2V/u4EMe+9ojy9
	2VoWNyI0mf7gI4Fpt+oM9uAFOnMJDocToXbrCq1zVz8aiZSHMS6/w2rCPdej0Nh1MIKDh8hTact
	CxV2dKxlHs9PJBe6Lt9I6kxqQkCkXLioF1YrWvZ/++ojE2vzNn9ziwrZHN6TYI1cFQ1aHcTdHD9
	h6jL8=
X-Received: by 2002:a05:6214:8017:b0:89a:6263:feb6 with SMTP id 6a1803df08f44-89a626406c4mr2042136d6.4.1773143246032;
        Tue, 10 Mar 2026 04:47:26 -0700 (PDT)
X-Received: by 2002:a05:6214:8017:b0:89a:6263:feb6 with SMTP id 6a1803df08f44-89a626406c4mr2041896d6.4.1773143245673;
        Tue, 10 Mar 2026 04:47:25 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b96da58b66dsm369600066b.42.2026.03.10.04.47.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 04:47:24 -0700 (PDT)
Message-ID: <e15f11d0-9b8d-499d-8d57-a465c65a9c64@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:47:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] clk: qcom: gcc-sc8180x: Use retention for USB power
 domains
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260309010214.224621-1-val@packett.cool>
 <20260309010214.224621-4-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260309010214.224621-4-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEwMSBTYWx0ZWRfX4XRNOSeQL8wQ
 yqp4T1HfEFzfSph0rwduTmgTiSqqONBhe9T0jFBUreJkTt1pzUuU0PkuEjPxVySV7obZm0OnCit
 ObxjaYB05jE+i4j6nlNe770Ck/E7+97cMu1wYInR1+kUkHEHnYqvs6iUAa7YP2Xm9OP4eO0qMSt
 ncmFD1v4zcymxhq8xmc17f0HYhPJzOQkBK9eu0P9bRKXQExydhXM184XC4xuhIQ0laHlYEouKMK
 yxW5inJtVVpe4+521ZQ9FaYgYs/hMeWR9uF81AU3EFFvk9a2VCz57C5u2PKzyTHFnqBfycQIoUV
 oLesXNCwdsqIPt9NMfl5JqZEyyKzyb4VI90BrYchOp3zTThq/xzG7j+6Pch1m0MjgfhmICe+3I3
 n+85/ZYw9RrwM8WR8ve8Gps3Afi5UAMrumpByeN0BjGU75uMFjMC2EtLWILLz112MUia+yBRRxY
 v9FdunVXxAJKsg+tOCA==
X-Proofpoint-GUID: -69Xlt417bpUXv1NES7WwxHC8Uw0h6EY
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69b004ce cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=M0n0xMwgRafrvhQXqkIA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: -69Xlt417bpUXv1NES7WwxHC8Uw0h6EY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100101
X-Rspamd-Queue-Id: 35C7C24BB17
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-96627-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,packett.cool:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/9/26 2:00 AM, Val Packett wrote:
> The USB subsystem does not expect to lose its state on suspend:
> 
>     xhci-hcd xhci-hcd.0.auto: xHC error in resume, USBSTS 0x401, Reinit
>     usb usb1: root hub lost power or was reset
> 
> (The reinitialization usually succeeds, but it does slow down resume.)
> 
> To maintain state during suspend, the relevant GDSCs need to stay in
> retention mode, like they do on other similar SoCs. Change the mode to
> PWRSTS_RET_ON to fix.
> 
> Fixes: 4433594bbe5d ("clk: qcom: gcc: Add global clock controller driver for SC8180x")
> Signed-off-by: Val Packett <val@packett.cool>
> ---

Take a mental note that this is a workaround and one day we'll get
rid of it

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

