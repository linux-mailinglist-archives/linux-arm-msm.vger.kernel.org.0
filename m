Return-Path: <linux-arm-msm+bounces-93145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJ8uI1xYlGkXDAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:00:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F092A14BB35
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:00:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59C583014564
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAE0F3370EC;
	Tue, 17 Feb 2026 12:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m1pbFrG5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fSjVDFVu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFE8335077
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 12:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771329608; cv=none; b=ct6HqxmmtM6kgvtao9ifhbMKcfWQMCeqzt1Q5EKDfURGbFxMS5bwOvNX0gVBp3X9KBqPLc+wQUp4rj4JH05c193bZ1A8YXHmmCUiWKqL143paeHfZyFcNWfv2kseHIyDB0QaTAwhknzyaMILB0ZJPafwxizzHzL3HW8EDRI1YOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771329608; c=relaxed/simple;
	bh=6MMqyUhkmPFnWhc0gV4G7uCa+Gk3mNB4cpDWSEqLgLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=htMrOaoXtgxywJkbol3uCwU2QtR8b82CjCeb5A3flUnuG/zskC4JGxhZMQKnKZalg/z08nILAR+ZkZR1UaT43KO60MRLd1gdN64nLVNx+sFaY+I0ZlKBFibym3jNPf9wLMYpVy/yq+72N/L9ymWkNeuMExDyA0ROE4GqO8gU+ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m1pbFrG5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fSjVDFVu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HBqWtm919268
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 12:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Fhl1UjWTwf7RXcCYI80x7nwW
	jfWc5ixK5Uw/2Q7UGeY=; b=m1pbFrG5KrTOa6Dgli4a8bIxZjCcfhD2uCw2Xfpu
	nwwPLzJdFzp6FvT8BeWLT0bTeZX4T6m8FvrTQ2YXwlSbhyEnqIvNIJGUpe8Jtwi8
	2HAgbYwkT/4UCChjpYMiS/DNddD9FWNhx46vVsyt3kmD7+gej07kKc9Bf+jATll0
	KFYeyJn5Kk+xgbAXjMOnxlelJcLcky975j0DLaiQDVejP+dLrk1OO1VOhVnZI9Ia
	PL29VGDCuWq89ss/vDRjEWZ2wiEETfT4Idv5Mhh5+CNQrQGXSvUheo3XitxUBaOb
	L4jZ6PtrXjgxwEP5VNROuEn/Qxk8P/Ut7J27NU9Zo/Ow2g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6d828br-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 12:00:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70ef98116so2870395585a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 04:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771329606; x=1771934406; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fhl1UjWTwf7RXcCYI80x7nwWjfWc5ixK5Uw/2Q7UGeY=;
        b=fSjVDFVuVAxrBhyP5Wcdrro3JqjlhHq8eI4Zf1vvsST43wNZE17Zt5928xaSqE3yXi
         fwWF5uNllJ5bTX1M9xZL320TyDBMctI2yUCcm4J5fx4PP5ydcJ/6WOCU91E1n0WJptgI
         N19giIjc3v626dfzomY1CWdSejNmF7lZY9xq+SbuMkrC+xi7B1QDS70MARHvNBWWEd7i
         mkgUe89g1OYDsVmOUKHQ+or5RmUYgoHMWdeOeXqL3Ej2nIBrxUqFANzd4iPBjQtY5ohj
         oQw8R+w13dyQFMsWvC9My62nkIwyrcvy6kgmoV6/IwfD26MD1BnU8SD8JgJZbndvpm6/
         aX7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771329606; x=1771934406;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fhl1UjWTwf7RXcCYI80x7nwWjfWc5ixK5Uw/2Q7UGeY=;
        b=wkBBGs8I+L0ODnJKBchna2CI/hSuWqev8pBjeHpRcWILz54ZavvC2YGUV80l2UVPC3
         OQyk401oWoOQ2B7FNaH60NT12Htu/5I86SIMPCxrP0sArOPl5kjGVGqHtJVLJMf/NNRz
         tRoRlOYcQ7IQm7r+/P8KcUxbhStx+FBE/pgSikyO4+UWug4Ck2Xhflzg3N7rFO/4Yf9E
         PQs9tqixAebWs+RurPmUqlfGp5OXzvWX/5UAdADx2d+meQZ7x8nuyqFO70W4XsSF0dSM
         bwOZS5DmVeaQht1/fq6KRxcgpPJzh13nDYIt33fpI3erToR2fY+tzxZDiMqBQyDMiqxn
         FeeA==
X-Forwarded-Encrypted: i=1; AJvYcCXK2bzRdzB/iSu5ex2vneVqTUgXBRr6BYrcpcveiLrjV1v5fkogN8tWa9Q5BHKBJVQqZGisyXko7zI+X5Zo@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3ioTymr55vHmNK4RkhTda8TS/mkJujPZmDkDW1HQK87nxsJbo
	hfC1VvWuR1nFrzHwQwRsYM52pf8/lxwfnLOb4TdHKGqDcwoPGTo14eLwoud0QIO/uMYKD2C7q4I
	7hRRECfqIM17vrPtJyiPAUL66CW1bsoUK2sQQaaCIAgvB3Glm/LhCUm5fwLaeBsNFv6ic
X-Gm-Gg: AZuq6aJfvyAsb6xKBmw9doib6oHz5YCKf1aoYVZJCkVlZCqYHPOQyYkOzOizrBjasM8
	6koq8mosu9RknD8WZTcyn25mibJsKLU9QiUS01jx92akZmiaMMl1RH3GVXyyW0MhbAECPk0SxN8
	65uqJ1gNFnSi7RzV7vyYDae19ETe/vz3bCEJEzJMClqy/0ykpEalOemPDov4ivv429qfFAxxceD
	RYRW1Xv+8AwO2QMXVpaS5Av0JprubgJCDMzZNmoNp/ZJGcW1ahBc57fL+Sp85K9dy16Mcrb1vDL
	EjYqY2WtPIRGraCyxBlh17YgnPzopFdxdfpFz3oRKItScsaaRuT81EHXMwCnZDJpMEtmwK+9wmD
	gQZUgDTow9XnHN6eT4qoaXRO4OX0CIEi6mBhA
X-Received: by 2002:a05:620a:1725:b0:8c6:a5bc:8a80 with SMTP id af79cd13be357-8cb422a4a96mr1696753685a.29.1771329606036;
        Tue, 17 Feb 2026 04:00:06 -0800 (PST)
X-Received: by 2002:a05:620a:1725:b0:8c6:a5bc:8a80 with SMTP id af79cd13be357-8cb422a4a96mr1696748285a.29.1771329605395;
        Tue, 17 Feb 2026 04:00:05 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5d156sm37249045f8f.5.2026.02.17.04.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 04:00:04 -0800 (PST)
Date: Tue, 17 Feb 2026 14:00:03 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v7 2/4] arm64: defconfig: Enable Glymur configs for boot
 to shell
Message-ID: <6gyznxpfwycerkrxmqaxblgkrvd3cn7gs2hvm6tbrdhnzmgmkq@brrxwzm4zvdr>
References: <20260205-upstream_v3_glymur_introduction-v7-0-849e7a9e6888@oss.qualcomm.com>
 <20260205-upstream_v3_glymur_introduction-v7-2-849e7a9e6888@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205-upstream_v3_glymur_introduction-v7-2-849e7a9e6888@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bqVBxUai c=1 sm=1 tr=0 ts=69945847 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=X6lb09SM9k0nLHDX1QgA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5OSBTYWx0ZWRfXw9eve3Ga3v82
 xOvLByDXnUGI2cbnaTXYaOE+s6qJH4bBRgMukbdRerrhmQdDmuIgfmZsOepBZe52JVeXh/dcb8+
 LYFvISpYl1yPf6Fmrjvt/m3Ba2HAwTaTl/BD9T2rTQPt2x8oJ/yQWyRb4LEd/+TlT+LtnIGXMkJ
 XUU00YDQi5sopMP4gnQmfQjE4pgV4w0np2ItKwJpY8akK5sUJ+RPDRlovcNlMAI8SSCR3ouH572
 iv6AkIlh6/NTJqYlEV0YWi8Bw739YPkhXlh8kNH3agyedjxhT5CDApONtXIvqp6fjlLDFry+YUi
 n9sk4OBcAzfYal832uYd0ikUJF5egd5HhvLO2ny9KkfLNDP4RZkzlzrCJ+J1afigGNeIpw05EF3
 3+T1mzd7XEziDK60rYf+tcQiwPSd1JeIxFZiJgSY9pzn+QWHuu/+B8sRV2R3xrztzWpqwYlEBVW
 1iKRJoH7JuA2Q1LvJhw==
X-Proofpoint-GUID: qMuyExLkeyccVDbhem3_nwm9O1Vmj5z9
X-Proofpoint-ORIG-GUID: qMuyExLkeyccVDbhem3_nwm9O1Vmj5z9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170099
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93145-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F092A14BB35
X-Rspamd-Action: no action

On 26-02-05 17:50:42, Pankaj Patil wrote:
> The serial engine must be properly setup before kernel reaches
> "init", so UART driver and its dependencies needs to be built in.
> Enable its dependency clocks,interconnect and pinctrl as built-in
> to boot Qualcomm's dev platform - Glymur CRD board to UART console with
> rootfs on nvme storage.
> DISPCC enabled as module, used for display.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

