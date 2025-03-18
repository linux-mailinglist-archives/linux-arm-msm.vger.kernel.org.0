Return-Path: <linux-arm-msm+bounces-51841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2DFA67F0B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 22:45:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A22DA3A4221
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 21:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 726F42063C7;
	Tue, 18 Mar 2025 21:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J4DEoCaJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4707205E36
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 21:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742334271; cv=none; b=EjXW+8C0FfD7taMOzgLsP1kSCLyHa2dY4gYlAmbDejVJ/6taBUufxN4AC8FA5tY7lIa84R6+AwjJsEsy6HQ8l4/3U/EfZM4ApdLBq1ndT7ibndq1H1VWiQZSwCcSxx3fkweRniLtufRUK7mYc8v8fZcUr8vIemhEv4K2bjuEf4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742334271; c=relaxed/simple;
	bh=TGV1iiBtpU6DlNPbSr9jL/2edektsrveeruy0yqOQsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RB/ZVqTZswkyK0GVriuxXE/SWv70076MFSNag/zZx1TtmAq2DmQjsP6IlOPqtnOp3cUv/JE6iWK/dqZGxJ5Y+CGXIKzc7um91xY1mYDYPGsikoepUvdp4zd2oPixzz62/Dt+EYFwWLWD25EtU7rK/XtsjeGArApOwd29t/p27ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J4DEoCaJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IH9Bgm004745
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 21:44:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1AADZSfOJp1nqwWbAo5LBvnE
	CeULh4CN3wu8KY8UPqc=; b=J4DEoCaJzOk2VyeY5U33+eaH07Vb4XSJW1StC9Jy
	ykt/CDU29tYbROqazvA/NfwJCPVLCfsAMabfxoMyYDsWGoqmRsLXSeKShPqpcwki
	/abMPu2sHFTsJCTx3DEFyiIby/RmD/lweeAGjCJvnQzHo7gnltZW4iyWDzDsP/Sg
	dNM21EC3bp1CX3EyRktIkG53OVCXiiquwT4tpbkkCggLMG3zdorsxzbcpd5HBhtl
	yqoYZJUITMTDB065MF2NqtTDV5K8Aoz1TEJT5exag9p3Gyg6LvfCMKuRTzGESRDo
	IIcDBhsuHlnT/7hY/xaLUjS5Y6tPvEarTBNZJn04ourB/A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45etmbuvmd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 21:44:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c0a3ff7e81so1130685985a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 14:44:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742334268; x=1742939068;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1AADZSfOJp1nqwWbAo5LBvnECeULh4CN3wu8KY8UPqc=;
        b=X3bNdYQEd3wZDIVYiB7+tC4QGp1By3EzkLItg7uTLFg/Sa0rJ6vKgl6odi5Zh2Sf32
         TZZ8EtHzgvmHXB9Rjc4TjmPXECOswDRybfgBP6Aa2hCBVA1auwTuLsY8q9glPSAfhFkl
         EutviSvNtUJmSnD2u9wzuk1JHhNMd9sBSdQpb8+DCQzJTDuxq6anoq7I/+Ba8DPVYs1C
         V71RWqUAsoL83tkKZltxcRnaypc6d+BoFYdGPlDl/0vtHMyeYu7IN9QIYIgf1uJ/yVp4
         +1gBPD5W3hvjYTQ/RW5rQ9/Elf90JjBwVdmSMhcQPLII1OgL5sD8SKTpCKjd/QXBxU8G
         wSEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZhQ+f5Di7ldT56IAK8IN6IwXGvG+Zf68CXHdHRSXlQNZ2P/CQS8QQIc5TzGPQfvy+e6qLdqNfisbE9VgE@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4n/faIs0KFLfKs/CvgiHGg7YlQDs5jrv4LJVwpsaJbXlU9WP7
	Ld1a7E4qeCkHvh71XzFaounU4VwGHFx0rDPGijO4ptHTb/vhdcuAKGwvfU9BVJigrzzkrXNPi6c
	4ClaIZ6ei37wLkUOB6GQby8gBn96nxfqpItDOxRn4l6i+oB7Gf5+D/07VUatO8ziu
X-Gm-Gg: ASbGncuw3eWqVtGx7zEHlfiEhbPFoG76qMqWlRcOXIA2Wv2kQVdmWdK204hCVkWzcQu
	caYD2AHhNNZZhdkTawSqG4mRyCSPbfvDk1DqMwXl+41AkeU0obTIMEcC/ylc/MXVSHEHEm1dYD9
	dRj1BlFClkatuRoAPe6PvY3xg9qrbzGq4paK9F/fyil45+A8a6iIkKhPkAGYyJfrE89MZMozBpG
	DqUg8Mg8e6yJjGX+XK5BQTBt5aGOvPgF+NUzbo/uRXioejhkSK9yT91DSyWSw4qVnX17brlO4O9
	T18lxa/r9TQ/Z6kX5WKtc/mDUsA9bDT7nIG4/TC5xkJ03uLnYVrS5NRbTHHq3f51LDPh9GVdUqW
	3v64=
X-Received: by 2002:a05:620a:4482:b0:7c5:5a51:d2c0 with SMTP id af79cd13be357-7c5a84a2371mr32780385a.52.1742334267638;
        Tue, 18 Mar 2025 14:44:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6UtxUCzUOH9lP3JjinEPv01rFFWt5zsaCfHfEx/eMPLwAv0vPpL/ftuphg+XNF8apY83cqw==
X-Received: by 2002:a05:620a:4482:b0:7c5:5a51:d2c0 with SMTP id af79cd13be357-7c5a84a2371mr32777485a.52.1742334267258;
        Tue, 18 Mar 2025 14:44:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f100c39sm21020321fa.48.2025.03.18.14.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 14:44:25 -0700 (PDT)
Date: Tue, 18 Mar 2025 23:44:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@linux.dev>,
        Kumar Gala <galak@codeaurora.org>, Andy Gross <agross@codeaurora.org>,
        "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
        Andy Gross <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>,
        David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/9] dt-bindings: arm: qcom,coresight-static-replicator:
 add optional clocks
Message-ID: <3ibbttdnygwsikfm2anusyrg6zoghhlj5sfom2f4ujc434dg22@xa6x5igbrbmf>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
 <20250317-fix-nexus-4-v1-4-655c52e2ad97@oss.qualcomm.com>
 <7b0af57c-a38c-4c30-9bb7-efe511d6bd1d@arm.com>
 <klcggfxrhjqty4rktx24xmnosqnwzsbyfzgv5ea6okqbffyswn@5yei6276hlla>
 <eeff769a-ff81-4017-9738-98ad130980a9@arm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eeff769a-ff81-4017-9738-98ad130980a9@arm.com>
X-Proofpoint-ORIG-GUID: HBxfa6DRJyQOcjN5DdHeIPh0iZRzfs3S
X-Proofpoint-GUID: HBxfa6DRJyQOcjN5DdHeIPh0iZRzfs3S
X-Authority-Analysis: v=2.4 cv=aMLwqa9m c=1 sm=1 tr=0 ts=67d9e93c cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=J51RNj2YpcLuybvcX6kA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_10,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180157

On Tue, Mar 18, 2025 at 01:37:23PM +0000, Suzuki K Poulose wrote:
> On 18/03/2025 12:19, Dmitry Baryshkov wrote:
> > On Tue, Mar 18, 2025 at 10:38:17AM +0000, Suzuki K Poulose wrote:
> > > On 17/03/2025 17:44, Dmitry Baryshkov wrote:
> > > 
> > > nit: Subject:
> > > 
> > > s/qcom,coresight-static-replicator/arm,coresight-static-replicator
> > > 
> > > > As most other CoreSight devices the replicator can use either of the
> > > > optional clocks (or both). Document those optional clocks in the schema.
> > > > 
> > > > Fixes: 3c15fddf3121 ("dt-bindings: arm: Convert CoreSight bindings to DT schema")
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > ---
> > > >    .../bindings/arm/arm,coresight-static-replicator.yaml          | 10 ++++++++++
> > > >    1 file changed, 10 insertions(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> > > > index a6f793ea03b6c193fc0ff72a45e0249a63a2ba3c..56e64067ed3d63c5e293a0840858f13428bacb45 100644
> > > > --- a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> > > > +++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> > > > @@ -30,6 +30,16 @@ properties:
> > > >      power-domains:
> > > >        maxItems: 1
> > > > +  clocks:
> > > > +    minItems: 1
> > > > +    maxItems: 2
> > > > +
> > > 
> > > For the static replicator, you don't have an APB clock, as they can't be
> > > programmed. It may have an ATB clock. So minItems 0, maxItems: 1
> > 
> > It can, see qcom-apq8064.dtsi
> > 
> > Also minItems:0 doesn't make sense to me. I'd rather keep this as an
> > optional property rather than requiring an empty set.
> 
> Interesting, that must be atclk in fact. Because a static replicator
> only manages ATB transactions. It doesn't have an APB interface.

Ack. Unfortunately there are platforms (and grepping revealed more than
just APQ8064) that list the apb_pclk. We have to support those DTs :-(

> 
> I am not an expert in DTB schema. But the point is the clocks are optional.

This is handled by not listing the 'clocks' / 'clock-names' under the
'required' list.

> 
> Suzuki
> 
> 
> > 
> > > 
> > > Suzuki
> > > 
> > > 
> > > 
> > > > +  clock-names:
> > > > +    minItems: 1
> > > > +    enum:
> > > > +      - apb_pclk
> > > > +      - atclk
> > > > +
> > > >      in-ports:
> > > >        $ref: /schemas/graph.yaml#/properties/ports
> > > >        additionalProperties: false
> > > > 
> > > 
> > 
> 

-- 
With best wishes
Dmitry

