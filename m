Return-Path: <linux-arm-msm+bounces-90914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHx2INvIeWkezgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 09:29:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFA79E326
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 09:29:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 77A4D3001381
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 08:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B94CE3376B0;
	Wed, 28 Jan 2026 08:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PpKhHJ82";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jMtlWRcB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A5D329C40
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 08:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769588947; cv=none; b=TlqLOwgkI+Lhefcy5zbqrZ0L8xUVlzUbMGY4xwOmAAl5xjlwdf0iObTZdqszqNLG2JFHeoVSfY9OPXW6nw2C7nZA2qZofuLGfwIXmuYO1cPauViKJ91D+zy7Rl2FE7QqGQCXOewX48lFnmiw2Hajfn9O+DbDHfhkqMx8rbLSQbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769588947; c=relaxed/simple;
	bh=LMU2As8Y9okypFjE8E28XvSU7Umdb5KIagJEqAVe5Dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BD00zO69UhK94kiGdhbL0oIvUUbRjeKG7XXfaqmRtSfR/T7s9bbRJyI5hSTHTRkaUZ0wyybgUeFlNHKkjrr3Yt20mI4lJwbkdfrj/J/hY7v0ZpSl1GLA7FBX6DzLEti6xvYvVoh7vbKz0TXla/GKaPs/Q55tpbtCesUU9dM5/sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PpKhHJ82; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jMtlWRcB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S3aqfw1952942
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 08:29:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fy22BXGx4/7n6Xsxm97fK3Rb
	VnaklszgkxcvqnBIdco=; b=PpKhHJ82aXYdurde6QmTx6BN5PIfAudUqdueWgtA
	o3G6jgYbT42RtxrVCAM9P4Cmb+vlB25NkFZs+9O9/qjE+5xA91MmtkPAuBqqDyyG
	6iPq0AnJ75m2hwYVtVC96O3ofAPnuMwpRKqVjxECpVN5ZtIZ5OlSYpLSFDu0bAZX
	S7fu9vf236Z5VU2Aa3toFM9qNp4JVq8kiElvMinJXVdqITvc93Z38r2NnZN0J5uv
	eIr90zD/c9j+e0l3pP51VPQzWCl3wFpU6iFCB2ZUFlnjgfG+27C5kmFuZYcpauwX
	aw/gHRgLa87BLmB2RhZCAxRdM0d2qEGSbiF2dNonhJSdMw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by211ag3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 08:29:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71500f274so35973185a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 00:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769588944; x=1770193744; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fy22BXGx4/7n6Xsxm97fK3RbVnaklszgkxcvqnBIdco=;
        b=jMtlWRcBf4iQr64x6mXrpDwq61oby9cXJGrXOXR8Ni15zp93L8NZ3YNCAtVHhNIC1n
         cdojF3okqAB167YeVp5y4Dg2C1pJg0m9ZrBh6p4PvVUDqv7iTLdzqsOgjEOquwEXC0CE
         G92KNwqqP6TjBDtget2NbaBGipRdzMW+5rwELKuEmRXQN5/sUNtkg0OfnbSz3Du11to9
         nqjIl/MEA7vfVmyMsq2/jySve/y9g9r9ql4mHTxThkOtce+o07262uxoRqzHgqibRacg
         Tx67UFcEPxb5qvBqh93aug6EEveeFG2YdjLnCd2CuS9dhgKSYajUNa7v/jBTk0ylHwW2
         D+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769588944; x=1770193744;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fy22BXGx4/7n6Xsxm97fK3RbVnaklszgkxcvqnBIdco=;
        b=dNRxspa551p1Rd5zZ9ti3xLKbPMD+W1oad/GmYHAXzGScfyX77Q2FFjUWBUORkTN7o
         VM6FE1tSyAZ+IwBxl0G68IOckVo0e9vMCpNRKUrBUytoxJXD2dPHYqDXu5U6aS/C+2Kj
         V1pGo3vktRmjGhvWmIkFmtpZcgkEzblM2JEvpBK303RUi5tLIYe7v47aR9SOU8B/c0Kd
         FPCcCMjY++zwfRriK6O6b9k/Cf2Z1/uBzKqMCewOqInUMzjpZ8/mtIZh0BXzDLZkU6FY
         graev8G2qHi8yEGQOI4a3Bsi36hbE5k9PYjvKPIbIp+/KIGod5tKX6Q/RPXbfJAXmm22
         oGzg==
X-Forwarded-Encrypted: i=1; AJvYcCUU+A8FocLG1DvUB1OaCqtl4vudcJdP/zTcNHzCaOVpVwmPtDE0r6CIyIzpsup5s4DLL4WJChTP8vqMkuo6@vger.kernel.org
X-Gm-Message-State: AOJu0YxsUCq/G9sKu4nhA5lRA6f4km8W9gHw5kIuB2BOIpzcWhqVkPC5
	KTEeF5wIWn3RxtCg6uKh017ABIeYJKmXvCuafNgSEJ+3S9hRUi69BxD3viJWN6VqKG5gq3fZv6r
	MhWni6uODZg+JgjLVNUQ1rkqpqMTubNqzHoAXJ0vJgcMCMugPjK8C0GAPdZFJ1AFYYaQB
X-Gm-Gg: AZuq6aLWhm3oq8a6biSBMzlvxyLDbrjkdaQUgR16c00fH800QAUV3LBBprd2kKsOTte
	cQBzxwuJCQwkWj8PJa5fc1buezIUBgHUcbgQ1bkxxU5EPO3XO69j9NrRP3hHUW1JVs6JGoVYey4
	iFRN0ulhsl+r+9JN1Ad6+L683LqKJ3/2dVYDK0t5a977H2yqEpF4R9Wvp+7kwc2Xc1Sx8sf+aGL
	i5i7TUDZEeHbMo6NcCWA4n2Ia6TGvUVFMVE7xyTiJJzru+WM5VQOPqf5/R9s8QTIqxVoSoZFnWP
	EAIt1tmliv1/FPOGL3cghTgQfoDXE6K8+fRQv7z7EsmRS64CRsOvw5qFwquiaEb186VA9PZHF/m
	/f97pj/FnE5b2Z6tTnePA2ts7
X-Received: by 2002:a05:620a:7009:b0:8b2:ea3f:2fa5 with SMTP id af79cd13be357-8c70b90e9a6mr543656885a.69.1769588944488;
        Wed, 28 Jan 2026 00:29:04 -0800 (PST)
X-Received: by 2002:a05:620a:7009:b0:8b2:ea3f:2fa5 with SMTP id af79cd13be357-8c70b90e9a6mr543653785a.69.1769588943894;
        Wed, 28 Jan 2026 00:29:03 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806d98c8desm36007695e9.3.2026.01.28.00.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 00:29:03 -0800 (PST)
Date: Wed, 28 Jan 2026 10:29:01 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 05/10] arm64: dts: qcom: kaanapali: Add support for
 audio
Message-ID: <7baeei3xgoyn2o3f5oqongx3ga5hovllkgbhemw36bphxuavw2@6pmdh4q57kha>
References: <20260127-knp-dts-misc-v4-0-02723207a450@oss.qualcomm.com>
 <20260127-knp-dts-misc-v4-5-02723207a450@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-knp-dts-misc-v4-5-02723207a450@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA2OCBTYWx0ZWRfX7qrgPUwtNJ0L
 TdMNmHsVNlEUQDBC9HMKAHso4SZiy1RALJysmPChygw7mno2G3t+UjgbUqRoLNkGFz7KFP9EmGi
 g8dWLDNlvBNHXMCGiecn/xZv53TtgEOL83S5HkOccSe42gSzziiwWJKlpHhWXeKi84G246I6HPn
 5128UdRrt5CD/A/v9Lmk5q/gMQ5SQ8xkDNwpLNIDHHbLLzIBgQIp6sjtMNmTaMVVkEhWs0xacs/
 bmPJSQ2k97VoBZbRujVu2ZOLQXx9otFhyvUqgpRd8+oDlMKcKioLSlUJmvq/I4xzFvnJjH2cAyx
 SYpGfAMJ8AI1HDVu6a39PxE9Dar1r/mfiAszjYwigyU9b8Om5fRs7PiYqMhIuzJLV85B7YDziDm
 bWa+15jouvwzd8cK+cH7W2ARXS7Lw2OKZAJXXoXSDnP7xjtVza5fVZPnDjPAjLV0JoEluVOeIGM
 FCUPmMEC24ATmqXJdGw==
X-Authority-Analysis: v=2.4 cv=GuxPO01C c=1 sm=1 tr=0 ts=6979c8d1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_ouoMj-Ftme1J9xZixYA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 2oysqBX8vss2tmuTff5zMbXXXPwImSvI
X-Proofpoint-ORIG-GUID: 2oysqBX8vss2tmuTff5zMbXXXPwImSvI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_01,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280068
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-90914-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8CFA79E326
X-Rspamd-Action: no action

On 26-01-27 00:34:02, Jingyi Wang wrote:
> From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> 
> Introduce audio support for Kaanapali SoC by adding LPASS macro codecs,
> TLMM pin controller and SoundWire controller with similar hardware
> implementation to SM8750 platform. Also add GPR (Generic Pack Router) node
> along with support for APM (Audio Process Manager) and PRM
> (Proxy Resource Manager) audio services.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

