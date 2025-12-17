Return-Path: <linux-arm-msm+bounces-85426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A0ACC5D21
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 03:50:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A27CE30101F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 02:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83FBF224B01;
	Wed, 17 Dec 2025 02:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NyslCeIn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CIe5U8p/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A92218ACC
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 02:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765939800; cv=none; b=FmL3sH9+ow49UjO/g/YUN7qjFAHBh1wL4mAUcwjcbkA5gW9AthjYQ3gSioyrxbyWL/v4fbs6RxXcVpznsO2OzzMXXOPbjivj8M9YQDAsN44/UtGjP1sZ+Xz5zZc8CZ3uUhWYWg+eFl7+TlybRepJDQBuEp/kSitayN4Zcm8TmPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765939800; c=relaxed/simple;
	bh=XkpSu1q0nhFZDSD6CiHASNA9/JePTDpyr5781opAUho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=keSFH5kSoWkwn3FWbhh/NDglXsMzSjCWdJDyp5qP3SrCf3xRG8+IPbd2+DrFY7WOlKn5Iv5SIE6hshvm4x83xfeh6ne03y8HMIfoK3kEarM35RDtrMF0kSzk1tihIeIVLFl0pgWKwY0jsZmOnbq+NDkk9/+Gneu5ytQats9NNAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NyslCeIn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CIe5U8p/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH0XiiV1687059
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 02:49:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hSr0hfpjiunYgxMiBK9XcZqGRzRse0hnRDW3pHNLDAc=; b=NyslCeInX+Gjk0fM
	u6NoYEZ0FK8v8b8aKBhyYySZqKuOBwgZVv0Yba0c4lDb26EX7e08BhrXTiRPmC+S
	L+5WDCo+eaqR0vo4SP2ABO3z8tiv8Md4Xq/JVzitm3+N2msl9m4vQo7rd2aL/Buh
	gKY7aIU+/cKYS2xuim4nT8WoanoAYbXQSN7qHO1bNUbczIjMpNH8ZDh3KzaV2SPY
	qQ7tjmvIDgZaVDsnmjxWs0gsT9Q3niK4YSy56V7sDUFNWwvz/XkKKusYMI0T+Qac
	L3UmzdPrvE5DOl0btg9HVnxvtXD+KVgz3i2iX7QZD8V4yIP8IWpTaOfnLx7MyAdO
	R5HM8A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3j39ga0c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 02:49:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2e19c8558so1228127585a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 18:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765939797; x=1766544597; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hSr0hfpjiunYgxMiBK9XcZqGRzRse0hnRDW3pHNLDAc=;
        b=CIe5U8p/jES3quRVBapg3hMxq1gdmU2ROZEH2BvN+1QSkiMQm1dDIF8qeyNz3VQygw
         KA4gzD9VvPoTQ1esW4sF8bLAEdaqbxMZUszaZOOqqqRiQqNEeRPO8Y3xlO3B61BKU1qp
         VVnyk2o2gtCRiRPu+l6a1irci44RCEAhh4JOOZxtiUoMG3lgomy4o6vCiPTIo8OwlEDO
         N7ee337n05vDVhgXXjG6qG+THWe1wdXZr802sd+ZAKG6K5GxcCI3dlPQ2Ak+5f9MDLwz
         zWrHkq9A7ky1cvSR8pjitAisH1ZDLqWn/oV5Zj3xUn5ohaKl1faEpsaJUsCmibOpP5fS
         MtiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765939797; x=1766544597;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hSr0hfpjiunYgxMiBK9XcZqGRzRse0hnRDW3pHNLDAc=;
        b=N5maxcpneigrtCP60lzamxedzE+e4vcNLtAlpsdC3o1yBg1qGSB8vPdddSGy3UeVSS
         TEjYfCktEPOPQX1V7s5Ew1QN/v+xjzCzu961HDoV+968ws+SYZ4YNqSdkdEHu8wHp+oi
         eGh0bSZ4taNm7XV4XbKn/2ptjMvd/jwTp4SMZKVgc56uM0aEnurHQLLxsYI7pLWYPQ4X
         7+DDfGuRx8JOp0fVoQ10JQQUjuNfuyOsqSYxUtMW85Wmd4W+oGv1aLI4NI/CNcxq1ssO
         vmyB4o7DwQ8eaRnghb69zrW4l8CtqOKsLfQTyKKccv1nCFBa1LpicyT9miW2piyEoCfD
         TBMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUx3+fI2v7SgeIRZcozKCUBpST6MfCqhmABJ62oR6kcDOuAh8FjIx6sqpikm0Q6Mv/jQayya6X+FoGLav9r@vger.kernel.org
X-Gm-Message-State: AOJu0YwI0CZZQRWKdPjUfiM7pfgk43Vt67g5EgMaGhuU0XI72TCsRdgd
	2KA5hA6Px95Ezz1BvF22173ptwMINu6WlDe0SCR9VRJuiT0gC6oN9Swla3tMvSxL+vEa+GR58e/
	4umwCYz/qHKTdL3s1a0xfwAid7Fd121wYHTsypZc/nEzSOUeV7kTrODOcAa0faTof9z8t
X-Gm-Gg: AY/fxX5Seh7m2LNPgGo8Q2qi8l7vNQj9CgD6MEOcI3w+1NO9TSLHbT3glKjoAKnZeD9
	y6qRYLPKI9Kuohj0dXjxO4zXI/MXVyYWDRiX3gTHiojlqzwY7H7ZXZgeEDH/R3IU2cqL+EPPAkA
	7uYgiCZNkGOin1PXBeoiDBn/RaepNdPTxhh4hWaEZMkfvuFqfI3qtFRP4OQBilvhpxFURDa7Lhl
	gHLxOk09asuIIDiGbJMo+aJ4VlWxbBj20DdgUcQWDf6Bb34P2uIMXaWqQg+VA4e9JUEI6RLxqr8
	3d+t5/e1EavDFoqx+lSo3sI7ZSkHQSQtxecb3wJFCJKLzOghwBmEMcR9/TGPs0An2g0uNkAStSr
	d7zFa7j1nPrkebMkWLSBXsw46nyob3L2YBk9w1DXlxKHgyBlHcy/nxAyIyelbjO7wmNnqnDI=
X-Received: by 2002:a05:620a:191b:b0:8b2:4383:b3d7 with SMTP id af79cd13be357-8bb3a39b8d8mr2263083985a.78.1765939796921;
        Tue, 16 Dec 2025 18:49:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2V4Ak+bxZ+9N52X69IaSlBoRPk/4ZmPd66syl4awFyKNhqXPj5s78LJaDXi8BFnuENUUgfA==
X-Received: by 2002:a05:620a:191b:b0:8b2:4383:b3d7 with SMTP id af79cd13be357-8bb3a39b8d8mr2263079485a.78.1765939796376;
        Tue, 16 Dec 2025 18:49:56 -0800 (PST)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8be30d8a158sm312944485a.21.2025.12.16.18.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 18:49:55 -0800 (PST)
Date: Wed, 17 Dec 2025 10:49:45 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: yongxing.mou@oss.qualcomm.com, robin.clark@oss.qualcomm.com,
        tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org,
        konrad.dybcio@oss.qualcomm.com, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
        neil.armstrong@linaro.org, jesszhan0024@gmail.com, airlied@gmail.com,
        maarten.lankhorst@linux.intel.com, linux-arm-msm@vger.kernel.org,
        lumag@kernel.org, simona@ffwll.ch, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, sean@poorly.run,
        marijn.suijten@somainline.org, abhinav.kumar@linux.dev,
        mripard@kernel.org
Subject: Re: [PATCH v3 04/11] dt-bindings: display/msm: qcom,kaanapali-mdss:
 Add Kaanapali
Message-ID: <aUIaSVObQJCJH9Rf@yuanjiey.ap.qualcomm.com>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
 <20251215083854.577-5-yuanjie.yang@oss.qualcomm.com>
 <176579137354.1486530.823295322686100207.robh@kernel.org>
 <aUEG3TL34CM2V5Z+@yuanjiey.ap.qualcomm.com>
 <CAL_JsqLR8e4FND5LfAVB+cJDMiFpgBTKZtpEDDQiuQfGJu2LKg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqLR8e4FND5LfAVB+cJDMiFpgBTKZtpEDDQiuQfGJu2LKg@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDAyMSBTYWx0ZWRfXy6hzYZX2qf1U
 NLrpSiZ3Gb0N/N2wRDjt3MiWrTHtP6zKSOwmxlQTWVzpOXDFDllXwGFXWXhv9zMVUcLJAYGD818
 g2J8gQTiaOkScEEYRIfF/qrCZv62O8EGb5H49j3qm08+KWJ0bNKKkTPXGpWJZCSdI2UlCZ3GZAC
 bmGoxrLqlwwxnPKPRmqD8MHsPEgG0vo6qFJOuP/5RrcPcNx5pTZgkDihZn5eatXJrmCSdTLZcvd
 Cxaq5bOSwO+CzHOU3URYWrKIrpmzQvO5aj7ht2LygcBnPtzFTrv94k42o5uRdGH/UH2LF83OIlo
 ZGnm5IsFBPhD7eTAhsXREBiAlW1+LgrEJOxpHnbPNPUH25JGIWqAadG6AIBLKaSps/MgTuVWeRs
 JjiT5qf4JbgjY8inMv4H42dSEt+9Jw==
X-Proofpoint-ORIG-GUID: pli6jSWwy81OUK-moE2Mam_fdGWpgTi-
X-Proofpoint-GUID: pli6jSWwy81OUK-moE2Mam_fdGWpgTi-
X-Authority-Analysis: v=2.4 cv=ToXrRTXh c=1 sm=1 tr=0 ts=69421a55 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=NpoKe9w8x2AnCwLKvqIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170021

On Tue, Dec 16, 2025 at 07:11:19PM -0600, Rob Herring wrote:
> On Tue, Dec 16, 2025 at 1:14 AM yuanjiey <yuanjie.yang@oss.qualcomm.com> wrote:
> >
> > On Mon, Dec 15, 2025 at 03:36:13AM -0600, Rob Herring (Arm) wrote:
> > >
> > > On Mon, 15 Dec 2025 16:38:47 +0800, yuanjie yang wrote:
> > > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > >
> > > > Kaanapali introduces DPU 13.0.0 and DSI 2.10. Compared to SM8750,
> > > > Kaanapali has significant register changes, making it incompatible
> > > > with SM8750. So add MDSS/MDP display subsystem for Qualcomm Kaanapali.
> > > >
> > > > Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > ---
> > > >  .../display/msm/qcom,kaanapali-mdss.yaml      | 297 ++++++++++++++++++
> > > >  1 file changed, 297 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
> > > >
> > >
> > > My bot found errors running 'make dt_binding_check' on your patch:
> > >
> > > yamllint warnings/errors:
> > >
> > > dtschema/dtc warnings/errors:
> > > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.example.dtb: phy@9ac1000 (qcom,kaanapali-dsi-phy-3nm): reg: [[0, 162271232], [0, 460], [0, 162271744], [0, 128], [0, 162272512], [0, 1024]] is too long
> > >       from schema $id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml
> > >
> > > doc reference errors (make refcheckdocs):
> > >
> > > See https://patchwork.kernel.org/project/devicetree/patch/20251215083854.577-5-yuanjie.yang@oss.qualcomm.com
> > >
> > > The base for the series is generally the latest rc1. A different dependency
> > > should be noted in *this* patch.
> > >
> > > If you already ran 'make dt_binding_check' and didn't see the above
> > > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > > date:
> > >
> > > pip3 install dtschema --upgrade
> >
> > pip3 install dtschema --upgrade
> >
> > After update package,
> > and use：  make dt_binding_check   I see the same issue.
> >
> > but use single check:
> > make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
> > I don't see any error/warning.
> 
> Because DT_SCHEMA_FILES excludes display/msm/dsi-phy-7nm.yaml. Soon
> (in the next linux-next tree), you can do:
> 
> make display/msm/qcom,kaanapali-mdss.yaml
> 
> Which will test the example in the specified schema against all schemas.
> 
Thanks for your tips, will fix in next patch.

Thanks,
Yuanjie

> Rob

