Return-Path: <linux-arm-msm+bounces-52764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A19A74A0E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 13:48:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4CBE97A3995
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 12:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5CAA25760;
	Fri, 28 Mar 2025 12:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gATY2C3/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755B812B71
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 12:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743166109; cv=none; b=DxbjVlXRV0068AzrRPkF3H0i4lPgXa7XxcdKMJpPrJdC9hgKRsWcg9zLEhXg7zzITIAIqXJMwV1xYa3l0L+PwlkEvcjwFkF+trykXYY6S62p+pl9N3bFxf6dwvj/f50TSDN6jEX9uywA8j3r+DnN6mbH4T1zIanlvlnvhXKk19M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743166109; c=relaxed/simple;
	bh=Cel7ccYVMHPCCmgn+VUjmkFBM9POaj8XCxVQSuiVHQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SxanLpjYKqqIZbig6M8H4WqYD54Ug+pH65espUwEQszPSWxRt9SObK4PoOUbIXcVWds3WBAadDqFXHYhLm6jKMZcJlr5ejGLLYKybuW2EcRVY4+p6uXMJtxSXdF1KPKDY5/7imGxN9o/COHPX8dwOsMEQw8kUUIaHhg9liX+pzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gATY2C3/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S5VX63012600
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 12:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YV+Qy/uGiVgEIzLBpOldth8y
	WefTUWIPYLBPGQJW+5M=; b=gATY2C3/LSfRGxtDXJzWTguWBUxQPe+2785QE2UI
	pN4QXbpXc1d03w2F/sEh0HbOX7JSUSlW2KEU3mAs9bDB9KJm4RUw6B4TiVhQQHWe
	uImWvq/WyyGavC8We9QFx7+lj0nisJ8IUXJb48P4g1SysGvbVqBdKo+QO4vgC/c9
	pkamoBMe9tsOzwq3DwCWWOHKM9gbvbknbni/vIr0LeG7Y3AAdHWon+1YUI5yhT5x
	dqOgsi5VLrdISlV3E6w7K+fd+OdiqBqSZS3LdJY7dUeVXF5r99Bdn0WlfdW44u0T
	vmQ9h9w51SsZALSr9FdDe7rbGsgI3qSbmWf7O7zeyeYU1g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45mmutpgtp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 12:48:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5f3b94827so234638985a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 05:48:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743166106; x=1743770906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YV+Qy/uGiVgEIzLBpOldth8yWefTUWIPYLBPGQJW+5M=;
        b=uJU1XcXu1VMQcr7wI38T/QdWVlV50Cfym2SKdj+ACl7aoHI1OmYtCN3Ltpjjlpl9SG
         uZW/U68r2oFW7CC/wBk6LwXQxnquhdntK2YoUeBF6t57umLmarWwzNxpYWTcCrZzMWqS
         8EB/77OkBNlKpt16ID7YAlbH6IbZFGaql2TH5xwnt8JWJ6Ayk+GSvjhqnKZesXmT8Qr+
         CXmKZt/0+6Wa541y3x6/NKMr7wGBQBMUlPCqUYc9xrxSF0MIsCrGM+YjvyE53l15cI3s
         0p40AKgDAAlVVWS39mZGJzrbDGqirK+kuPNlf1M/GweA7jvqtwigKPpbGaTCxSx/JOKp
         pwGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyt6br9oHnK8u3ougRbxaPREN4cB5Cv4gmfwwdnYUPUuu+0BCc9RuUgH/M4bcqGEX5GiYTr9sMl5eAs4VH@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1BHv1aDSL58yHSTIruK/i2JNxUL/ulDePVrMTvGQf0UrmOtKz
	C1O51Fa1c8Bj4xnTmmoVo6sJrqGN693Lzfgg8zFD2kXwDBcz5iEIIbhgYWiZ2MT26jw+Vps/Ar8
	uhdUc/X6GzljlntSBCP5emO5niyFZCHjsYcGMapEEqm8RwIbzWvaGVQhor6mx86UQ
X-Gm-Gg: ASbGncuobkCMazxsQo4ZesPvTTw1RasDfEQz0RXmuxMEVFh3uzVULEMbXFQt8/yIRhH
	HmV257NIqgiEWaQoLplpeiYp8lRpuTQDliTffXvnw/TTZIK3oPDifZ8n96gfPFhExpD8Rhm4CPM
	1l5o59mLaxcxywEYlBEJcD/1ksLZf7NJYwpd5i9Kj6O14ifTtfNbX/pXnl7vjAqnmEXn0zNYWgy
	1cA59iXrcNO8yrs5/9pruRfg+hWmt2v9wyeZxpXUhltmuSEQs7MpHwJA4yku5YPx/Yo1oXZfLXy
	9A44LQo7CAxLPECiEbl9Ad3il/zUOpFlDCB5BbvaoQvyd7uAGp3TY/D3l4BnXA+iJ+223ArGEdI
	jhzc=
X-Received: by 2002:a05:620a:4611:b0:7c5:50ab:de07 with SMTP id af79cd13be357-7c5ed9fda61mr1196563485a.21.1743166106050;
        Fri, 28 Mar 2025 05:48:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSfe1qoUpF/M62b+DetpqtJpHgBbIPS3Qb5a03OKSWkEGQgYqUXvfCuAM6pN4enFdUj9Ee0Q==
X-Received: by 2002:a05:620a:4611:b0:7c5:50ab:de07 with SMTP id af79cd13be357-7c5ed9fda61mr1196558685a.21.1743166105567;
        Fri, 28 Mar 2025 05:48:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b095a0cc4sm289651e87.226.2025.03.28.05.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 05:48:24 -0700 (PDT)
Date: Fri, 28 Mar 2025 14:48:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sa8775p: add QCrypto node
Message-ID: <gkjdjzmhtsr4la5ami4qnsqgrd3zzdvu46eyaxpwh2brfsqm6m@wwkuxljbfwa4>
References: <20250227180817.3386795-1-quic_yrangana@quicinc.com>
 <ea79cee4-8c47-4054-bd17-2097ada4e583@kernel.org>
 <b57fa204-d3d2-4b74-8834-3f2d93726a99@quicinc.com>
 <73ed6108-27ab-43ac-abd3-82656693404d@kernel.org>
 <4a205725-af49-4f28-ab78-7059451d66c8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a205725-af49-4f28-ab78-7059451d66c8@quicinc.com>
X-Proofpoint-ORIG-GUID: DWC3vVRRLFiN3uHoQxBuNDvV_S1oJ0nb
X-Authority-Analysis: v=2.4 cv=MqlS63ae c=1 sm=1 tr=0 ts=67e69a9b cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=XIGxjvZd5PgJVFysyh4A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: DWC3vVRRLFiN3uHoQxBuNDvV_S1oJ0nb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_06,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxlogscore=999 mlxscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503280088

On Fri, Mar 28, 2025 at 11:34:58AM +0530, Yuvaraj Ranganathan wrote:
> 
> 
> On 3/27/2025 12:38 PM, Krzysztof Kozlowski wrote:
> > On 26/03/2025 18:40, Yuvaraj Ranganathan wrote:
> >> On 3/25/2025 1:00 PM, Krzysztof Kozlowski wrote:
> >>> On 27/02/2025 19:08, Yuvaraj Ranganathan wrote:
> >>>> The initial QCE node change is reverted by the following patch 
> >>>> https://lore.kernel.org/all/20250128115333.95021-1-krzysztof.kozlowski@linaro.org/
> >>>
> >>> Use commit SHA syntax (see submitting patches, checkpatch).
> >>>
> >>>> because of the build warning,
> >>>>
> >>>>   sa8775p-ride.dtb: crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
> >>>>     ...
> >>>>     'qcom,sa8775p-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
> >>>
> >>> Not relevant warning.
> >>>
> >>>
> >>>
> >>> Best regards,
> >>> Krzysztof
> >>
> >> Are you saying this is not the warning seen at merging?
> > Tell me how it is relevant? Tell me how can I reproduce it.
> > 
> > Best regards,
> > Krzysztof
> 
> Below commands will show the above warnings without the fix,
> make clean && make qcom/qcs9100-ride.dtb CHECK_DTBS=1
> make clean && make qcom/qcs8300-ride.dtb CHECK_DTBS=1

You are probably running those commands on a tree where the patch was
not reverted. That's useless. Please update your patches to stop
mentioning the (outdated) warning and just describe your changes (i.e.
adding the QCE nodes, you are not fixing any warnings with your change).

-- 
With best wishes
Dmitry

