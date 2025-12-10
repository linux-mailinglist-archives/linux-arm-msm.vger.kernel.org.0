Return-Path: <linux-arm-msm+bounces-84933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F27CB3DA5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 20:25:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D42B300AB38
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 19:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6479332937D;
	Wed, 10 Dec 2025 19:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cJdSGV5n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DUwdYX1T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46BC2C3271
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 19:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765394739; cv=none; b=KRaLfY7J8bKwm12iKduVQdiKCTEuyY1hjXiZNpSN6Nj2O5I8sTU0PGKr3meaVxskBh3xv9eiFKlBoofqN9rxuTshyKggkot+Rlj+B1auOXw6esOxQMjzPplmn/gC9xtyfwySj1R5ySo/Ixnor12R0cSOmvEgBlS+8T1uAVK4qDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765394739; c=relaxed/simple;
	bh=D7mudJPeI1hJDn6gDAv1X9rSTls8Dp0//jRa56bM8Dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cmOyQHF7jd8SpdcBG8LeYL+suAVKyLind4slvZupTXEFInpzzs4vlrQBsdvadiQUqZ4Fxactd4wuVVQ23+OGoQ1du5gquZx8/2ssxB9umNi3tYu60RCm9SMiqLB+6kREtB3rEXuiEMMPSqRdE8CH0nO4WOYX+P4lJnGZ2cGVQrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cJdSGV5n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DUwdYX1T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BAIRUHN3178128
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 19:25:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sNUvDiFSuk29+BwU4LM3UlXsy7CBSwI76eKHWW5aQjU=; b=cJdSGV5n+Ug7pZmz
	N7PadnZ1b388lw2/TZim/4N4ajzNvbAZzxv5828XnUIgvJFs0H2qKCSACx7lLUAE
	OOeRBOWxHDBZniRqOlE/bEHyXDsSD7bBW+6Ci6YHGEeNEQj27lB4VPGjFpyqhGVr
	56Q6Ka5Olch6Cudj60IT+j9wM+U9jIxYluJ9EuOA4W/I6BDDiOrmoYRMFuXxyfjY
	/8/TatlUI2t9oF93tdIbGXhlTX1alzC1jOkvMbZg7zujVO8bjmBCLC8oSv4FFNzI
	N3fcOzaLga0B+Mxznl4KVSXRGsSKCvtuwv4pCqonM/o+Pdj0qY+heDXB2bE7mcyr
	bx6m9Q==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay1xp2utt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 19:25:36 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-55ad466ae47so276451e0c.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 11:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765394736; x=1765999536; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sNUvDiFSuk29+BwU4LM3UlXsy7CBSwI76eKHWW5aQjU=;
        b=DUwdYX1T6UQ4vOSJvwBzU0BwAk8dN6seGknQNE60DwbWj0mVPvNTWrSQE4XGHWdwd1
         KOJakzTR5R0K/6rrkE2D+faf4BJZieZnj56ovfW5ho9oNM7czpPnmYVRMEjzuXhvalwr
         N42fEWrxcMTLbBzFXREuQgrHQSFuhgOfJg2FxkozRA5/hzeGMkAJ+gYlYe/bHXv7XZa+
         LGxIEiHOrf4ndN0Li3ip+C6gQKFmgVpkMtgm/qtfM6Bbp3Q3/PgOPmZkZhxgEp328cKM
         FMHdio5gUy/F8w2KCp6krLxKpo3WbbBY4UbdxNBEQUJv5sU6MtGDsiB0Z2MFCnlsvr2+
         TW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765394736; x=1765999536;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sNUvDiFSuk29+BwU4LM3UlXsy7CBSwI76eKHWW5aQjU=;
        b=GieB4er6KZYxcRRxMvbSBAT1YVXzHM7DoErSimmDjGYQ0K7dORF/gaEsp+qIn00bnJ
         3EzIZ91xpMdLbItAUiCZHogLaH6acQZSspCsymZiC1sae1Fni5PwV0lmHoU6NW7E424i
         zZu3BVeak5vuU+URC2LwL7/v2/yVQUEUdoZUXdmamlQ0kKguC+/rnUN6D2r7JR9p2wu9
         0Btli0V6BIGLqLeGQOXsSRYclcVUCn3dn86urEq6dd0N4Ydi2R99asGs4XD2Up2trONA
         1AIOk5BFJ+Z5q138/3d9reWI5IlNsJQElDwOMLu+kzdvBo3tyks6AiIPsWWKC+Of42jJ
         uzig==
X-Forwarded-Encrypted: i=1; AJvYcCUAcMypuKBSbXdHjeS/YZ7v/BqnSKejERHC2dvdfTbmHWejdHvtP4uTA686G2Yo8ecG+l3X2VwKYen7f00s@vger.kernel.org
X-Gm-Message-State: AOJu0YxoAf3ZNd5rCIvGZv2T49BFXntf2Bfbms3NA2yLZ7Q75BMXOkSj
	UEtj/IQG+yVUOPxLwIXKeAPamMZgL+Go7bteuXQetp1ijIl/gsHa/PBHCOcyfOlypaZt5KiiQAW
	tn8qUDubgaDutVf/QEfBy5TRxEJuAKZuLx22QsJtkR6dTSTf8JIGiq7Qs189Vajcfn+3/
X-Gm-Gg: AY/fxX5S0JvgxPmINiD2RqRSSSM2GBhFgasRceBYABWmtyyWgc3pUeVN/900p3KSYE2
	dAaz9J293t39A43I7ogcIdEVcVPHZUfqkIPbGiiKN+J8FFZiecj87RcrDw/u1mXHAdJYh9jnzlI
	N8MKjz5YTxwnwIv0vVOFPx8PTI4g6/1kyTkuJzIB1wLCR9puMCqyTXfOvwCKQAhOCfZNvk/mhmH
	7z+fCRS++wXL93Zlc9S9y2bg4CiCKOS81ZFPX7lhRo4D1Pg0gW2fOh6V0k8Iqni2ULYr1mc/yit
	1xAT+pxt0orfc9zSPE9b23LW/mUgQEiWAIs+StUTB7fLbEClfk233CxxI1DQ+tk41jL4kKBvjfr
	HqBHtGPt97L3+6+/xOf6K2sT4RnOjHAeWIeh/mQlYEtFsgLtQjkMikHAwCA7Nm4bhlW6Ecug6WG
	h4XMgFNWRDT5rssFAmlcJjpDg=
X-Received: by 2002:a05:6122:3286:b0:55b:305b:4e31 with SMTP id 71dfb90a1353d-55fcfc59790mr1271057e0c.17.1765394735891;
        Wed, 10 Dec 2025 11:25:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7xQ2lo8xtQV3x9m4FzVjJfTJwMMg4HFl37gyVo6yMgD74bRuAg8950rMFPCAsUGiP1II0qQ==
X-Received: by 2002:a05:6122:3286:b0:55b:305b:4e31 with SMTP id 71dfb90a1353d-55fcfc59790mr1271042e0c.17.1765394735415;
        Wed, 10 Dec 2025 11:25:35 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37fbc9d0ed5sm854291fa.20.2025.12.10.11.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 11:25:34 -0800 (PST)
Date: Wed, 10 Dec 2025 21:25:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Cc: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v9 1/5] media: dt-bindings: Add CAMSS device for Kaanapali
Message-ID: <qfhlyl46i7az56t5ceyo42mw55udzwhxgpygw3jnpw3onr6qc2@5r3i6tb6ac3v>
References: <20251208-add-support-for-camss-on-kaanapali-v9-0-3fcd31258415@oss.qualcomm.com>
 <20251208-add-support-for-camss-on-kaanapali-v9-1-3fcd31258415@oss.qualcomm.com>
 <scnexmcrpemu6vcms3dmq7qjvx54h5pyumjvgqduospao4x2kt@hoi7zfygjq4f>
 <458a7841-e422-4cad-83de-f5b5c1b683a6@oss.qualcomm.com>
 <puv24qramoiq4qq3i4bibatg5ihnrv6hdloul5ajbblvasvwk3@nbse2m6aftkh>
 <2e38b9f3-8a35-4a27-82d3-c1d4996a1684@oss.qualcomm.com>
 <9ecf4783-e1a2-430b-a889-997689bafe45@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ecf4783-e1a2-430b-a889-997689bafe45@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDE1OCBTYWx0ZWRfX0fyBWCp9FN72
 qGlXFwNo1CvmpLx3+7IzKDmrwVgDUAwP6h92pLLCdwAfY0Tr6yqw+YMLPTDIGyiaq22kDDR+h9y
 Jh89SyqLu0BS5V6LSvqZbyV55PDPSiTEmOEITACmUIwgqXcsVxW+86P5gr3sDZzA/xKclCdxTip
 aRDbW5oj3oRZfMinEK9W2Pe+mL7jNGbcZ0pjHYO10+U0yxmLHoOtA808yZlCvouL6lP0e+fh8TB
 gjBMIveCitSiMxKOHb6JtUPCz1K8zOX33u4bmRILs04xaUt15hkAGq6KG4N83+sVykfcj1BOiHN
 lGD4ZQ8onWX0Z4uZbQu/Dps/k8f+o+3t507hxb6mwkNjDVLtXdiN2OTin6AWGOEGMrhHCT7HMSq
 csEGaBoYm6Rw7GK50rqHMdjGfX4SHg==
X-Proofpoint-ORIG-GUID: WWr3_tTFZ8p-DqdGdmYpAVw7XDfZn4ng
X-Proofpoint-GUID: WWr3_tTFZ8p-DqdGdmYpAVw7XDfZn4ng
X-Authority-Analysis: v=2.4 cv=A/Zh/qWG c=1 sm=1 tr=0 ts=6939c931 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=LZ9LMmeJzoCIL4emDIIA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_02,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100158

On Wed, Dec 10, 2025 at 09:50:51AM -0800, Vijay Kumar Tumati wrote:
> 
> On 12/8/2025 3:21 PM, Vijay Kumar Tumati wrote:
> > 
> > On 12/8/2025 2:48 PM, Dmitry Baryshkov wrote:
> > > On Mon, Dec 08, 2025 at 01:03:06PM -0800, Vijay Kumar Tumati wrote:
> > > > On 12/8/2025 11:53 AM, Dmitry Baryshkov wrote:
> > > > > > +  interconnects:
> > > > > > +    maxItems: 4
> > > > > > +
> > > > > > +  interconnect-names:
> > > > > > +    items:
> > > > > > +      - const: ahb
> > > > > > +      - const: hf_mnoc
> > > > > > +      - const: sf_icp_mnoc
> > > > > > +      - const: sf_mnoc
> > > > > You know... Failure to look around is a sin. What are the names of
> > > > > interconnects used by other devices? What do they actually describe?
> > > > > 
> > > > > This is an absolute NAK.
> > > > Please feel free to correct me here but, a couple things.
> > > > 
> > > > 1. This is consistent with
> > > > Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml. no?
> > > I see that nobody noticed an issue with Agatti, Lemans and Monaco
> > > bindings (Krzysztof?)
> > > 
> > > Usually interconnect names describe the blocks that are connected. Here
> > > are the top results of a quick git grep of interconnect names through
> > > arch/arm64/dts/qcom:
> > > 
> > >      729 "qup-core",
> > >      717 "qup-config",
> > >      457 "qup-memory",
> > >       41 "usb-ddr",
> > >       41 "apps-usb",
> > >       39 "pcie-mem",
> > >       39 "cpu-pcie",
> > >       28 "sdhc-ddr",
> > >       28 "cpu-sdhc",
> > >       28 "cpu-cfg",
> > >       24 "mdp0-mem",
> > >       17 "memory",
> > >       14 "ufs-ddr",
> > >       14 "mdp1-mem",
> > >       14 "cpu-ufs",
> > >       13 "video-mem",
> > >       13 "gfx-mem",
> > > 
> > > I hope this gives you a pointer on how to name the interconnects.
> > > 
> > > > 2. If you are referring to some other targets that use, "cam_"
> > > > prefix, we
> > > > may not need that , isn't it? If we look at these interconnects
> > > > from camera
> > > > side, as you advised for other things like this?
> > > See above.
> > 
> > I see, so the names cam-cfg, cam-hf-mem, cam-sf-mem, cam-sf-icp-mem
> > should be ok?
> > 
> > Or the other option, go exactly like
> > Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml.
> > 
> > What would you advise?
> > 
> To keep it consistent with the previous generations and still represent the
> block name, we will go ahead with the style in qcom,sc8280xp-camss.yaml. If
> anyone has any concerns, please do let us know.

Krzysztof, Bryan, your opinion? My preference would be to start using
sensible names, but I wouldn't enforce that.

> > > 
> > > > > > +
> > > > > > +  iommus:
> > > > > > +    items:
> > > > > > +      - description: VFE non-protected stream
> > > > > > +      - description: ICP0 shared stream
> > > > > > +      - description: ICP1 shared stream
> > > > > > +      - description: IPE CDM non-protected stream
> > > > > > +      - description: IPE non-protected stream
> > > > > > +      - description: JPEG non-protected stream
> > > > > > +      - description: OFE CDM non-protected stream
> > > > > > +      - description: OFE non-protected stream
> > > > > > +      - description: VFE / VFE Lite CDM non-protected stream
> > > > > This will map all IOMMUs to the same domain. Are you sure that this is
> > > > > what we want? Or do we wait for iommu-maps to be fixed?
> > 
> Yes, when it is available, we can start using iommu-maps to create separate
> context banks.

It would be necessary to justify removing items from the list. Wouldn't
it be better to map only necessary SIDs now and add other later once we
have iommu-maps?

-- 
With best wishes
Dmitry

