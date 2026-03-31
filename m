Return-Path: <linux-arm-msm+bounces-101115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCCUGVgOzGnGNgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 20:11:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EADDA36FC35
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 20:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F3A3830234D4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 18:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBAEF44CAEC;
	Tue, 31 Mar 2026 18:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bq80lq1q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XtYAI9dU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2EB44BCB6
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 18:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774980171; cv=none; b=WtCRBOXnEm7zoaJejsvH/sXaqvUNO0Hbz29310xzoKl4nYKZfqoM9tOv7XqUtFqGjRRtNx2hVKUtg4enbjTRkASDk9Bf2A5nKK9jy64Rfr3auBcbCI11Lms6XD9CVfpn+RzbrjJr/7F+KtT+Z9XSGsXpKwRyKThI7YEGUyeMA+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774980171; c=relaxed/simple;
	bh=kIInkhogl/9wzYo8dZxkZhYWKYdhxVy+w7gomLAghpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rP/5O2QpmQ4pfXDi2uDhbW/BEqv8HBMLZ34pf1hXUKI8njXgWbVMf1RrL3i4i62XMtRwqpxRFokgioJGTPA0w6tnWpSwbw/LfeOwpUR9zA3a2ik2DEz+cl0tAMvA2tnNFMnREI55B483AMGwgad31X5lp4TFFQmp0LxcKYWRSTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bq80lq1q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XtYAI9dU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VGdUCQ3239958
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 18:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LYXeANNp46O1Wvc2Yi4Z6Cnt
	sJP9GZeKSl3LmHEd+g4=; b=Bq80lq1qXm4jm4w3ZSiGiGf1Hwr9wCOzc5Wlf36I
	mQf5Lf/ILp68saPNi3SvLQDOxUGMwr916/tsYMVQ0gVgEf/toRmZD3ZToHxT73K5
	GsbbYE34staRCZ+rEcCAK1ayaU2ZAKZx+ByCLRwggdKzLQS6ocoRMKnhOjMPPT8o
	N66kkfdK6G7dkg9PQsaMa2VGIPOvLf9Wv+cz8K9MS78kWBs7J5PKnJn0zpNNBBrV
	2tmf7lB7/Hf4xvX9zEdjGWk4/QAusxPUJlsE1wpXWZvie9NRZ8ck2oWAZH/Ufiis
	tNleTOTbYXCZjPR+/wXK13+t2lhkimVwlHZa/zYI7R+1DQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b1yte25-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 18:02:49 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56cc7b6730cso470869e0c.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 11:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774980169; x=1775584969; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LYXeANNp46O1Wvc2Yi4Z6CntsJP9GZeKSl3LmHEd+g4=;
        b=XtYAI9dUzapA6lTf2EtEmtsUYZnavlLNxGIq669oHaz0MrPOyN8g3/UbQ9+2BoWRTY
         W53851hUa4l7BPnglZMxcW33gZtGk/OTuF2CZl/4rN/HL6Gxq3jZEqJ4n0sbeOaFxEUW
         FBESf0WHNG2D1jz7cq1QRoTbCOzkZgimSYnG5AzLC+WB5cWirU9nwvhaRzISbkYtL7iy
         czYtvs3oG4GcrL/OvF4AnlYdpTV5eXbmiwlaxU/DhdpN/2MDrTX3ywehJcDM00bv5vFc
         VJnCghXvPdDP49y7Q5BX2i8XxpBPKcOcnBajyWqixEkRW5uUxGYUAzJoNfTtoiBQ0XjX
         ChBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774980169; x=1775584969;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LYXeANNp46O1Wvc2Yi4Z6CntsJP9GZeKSl3LmHEd+g4=;
        b=CxF0nqJQ87mIEKCLegG6/KFPLEom8BxyV6O/JAvYiN4ypvvMtbyuw/XsEdQBTA1TsM
         G1Gf7ro3eqhtMzn0tkuCVq5ZQ4HD6jAjVA0AIGneIdumUcp9a/QnfK7QRemBku15F/Dy
         E9AFX9OBK6bnYo0KGiBvjUw29DOtG6nOe/uw/BnyhYPl1p6Deu4K2RSyfJfLvnEQgWqo
         +Wtx3qYWAMBmlY9uxly1xqkm/CEemBnuWb0vUOoxFGIqyV5f8ojHmd8GPG8iCvB4ZQEq
         LM5WrqR0Jo4O9zGf/jTKnFZGxWW4fJiWUYgLsXqDQxmNCs5KK3PX8I0q0eKMRldMiztH
         Jimg==
X-Forwarded-Encrypted: i=1; AJvYcCXagOapOYUdxQnBiziWHjrNXmL4GfswshxHEyBM7Lbx9NSLVU3IOoqoqCaG5ZUCSARYLeqQhbAypFSa4R62@vger.kernel.org
X-Gm-Message-State: AOJu0YzEZTz9kFUpjftZIM/BxgspJwOw3ysEYcGHifj3Psk9i6q4UrOU
	S3kG/SHX6NUcLYNGn0x18XZNRNyYfTl9P1IJqfpOglXXYT5m/KxIsxpxZpMTv0mBj8qfNAlJ3vx
	zDyqeFTt5N/iVTTFCqDLkm2XA94Y/rOXnhxOSrTjeWErzOCbPp+a7ttnxic0Y6Y0RU8hO
X-Gm-Gg: ATEYQzy0nSL4bVTPpZi63ktzC6aVrKqUS5kUB5MIUG8kA6M+0olQMClTaSdg/+G1WyC
	SelOqjPtazEtQOoJkTeCSOjSmug8KgtT3sQZLPjOiEQgt0+xjqSCDbsSDNjQB1kfbNAzj33hKYj
	fZHxWzKE7OsG2KMufeONbxymnEsnhJbkjaKF9aockm5zkmdmD4/ChtTqyQ2NlL1ck1/27dZOBLk
	oz3flV/AQBYDuz1ZUCngSP0uM9il0hYfaJi/nhwdPjx4s/fhzmAJvhLu9BhvWkOOziLSg0cu3bL
	pfEkGLvplcZXioRg7TcGaYtqryY9Lfw7f6m1MoimtK+IsmTDjcbATFMRuBOXT7kCaXkaDtmF4Sf
	HukXuc/4aq2scXb7Yql6NypfqZKZywO7MOLJFhWZz7F6jP4GovE6c/d9tBK2AYTQ5Bf/osd6NQ4
	suGfcl3o0dm+cFETZqHfBqIUrJ8zIfcXNO8TY=
X-Received: by 2002:a05:6122:c20f:b0:56d:892e:e291 with SMTP id 71dfb90a1353d-56d892ef3ebmr469126e0c.9.1774980168648;
        Tue, 31 Mar 2026 11:02:48 -0700 (PDT)
X-Received: by 2002:a05:6122:c20f:b0:56d:892e:e291 with SMTP id 71dfb90a1353d-56d892ef3ebmr468913e0c.9.1774980166224;
        Tue, 31 Mar 2026 11:02:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13fd008sm2656909e87.19.2026.03.31.11.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 11:02:44 -0700 (PDT)
Date: Tue, 31 Mar 2026 21:02:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: glymur: Add qfprom efuse node
Message-ID: <e4ehmqufnyfwqyedxc7ibu5jnjvfm7ghlxbai2usy45zbt33n7@qkfbhvnx5i3f>
References: <20260331-glymur-qfprom-v1-0-5b4284d23c80@oss.qualcomm.com>
 <20260331-glymur-qfprom-v1-2-5b4284d23c80@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331-glymur-qfprom-v1-2-5b4284d23c80@oss.qualcomm.com>
X-Proofpoint-GUID: DqKtq6EZ3Qsm8o4kSaCDICmUdM2e6k_X
X-Proofpoint-ORIG-GUID: DqKtq6EZ3Qsm8o4kSaCDICmUdM2e6k_X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE3MyBTYWx0ZWRfXzm76YraGPqy6
 9XsRZAYFSShg2bqrhy+FoFJMouzvLZ7EDpHe9Si/pre/HkSEmRoUyS3OaC1dl0zkO274ajfQt74
 N4dcammFXPHu6otZKYnd+jc7IIoQaYeTBNcYCxpuKvwEan2VJyZAzeYCiQS18SxL5dya/646Ae0
 HNcUggW2XnI/5RRjPV+kf4nYWC31a659Ps6stVq7TTvt9UomzIrEZjetnfG1uY0TsD1zD1q8XIF
 VAnwDHc/RO1PDvmOTqKKTLiFsX5CilkoWGT2jPBStMc+G5d79lgXYjNxOeCUiaK6cCOydvTDVmo
 ju1OtHJvrFK2STV90C0UNYTk0VsveP7seboMGINSBqQHF8v7HOaRBag6Rm8D6DnZQ5MJbXFwJeN
 Z1AFVObhD3qKRfRLjOZJgZ2VxnByyBMt+LyCz5VuyS09flEQQl3V3cmzedX8NhJseKhvO4oNSqa
 QPXWPpKtxYBP/xV42lg==
X-Authority-Analysis: v=2.4 cv=aJT9aL9m c=1 sm=1 tr=0 ts=69cc0c49 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=6WES_QNn75EKstuLRTMA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310173
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101115-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EADDA36FC35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 07:24:21PM +0530, Pankaj Patil wrote:
> Add the qfprom (Qualcomm Fuse ROM) efuse node and gpu speed bin child
> node for Glymur SoC
> 
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

