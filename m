Return-Path: <linux-arm-msm+bounces-75985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC2FBBCCD3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 00:02:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1C8424E035B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Oct 2025 22:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D5D41DC9B1;
	Sun,  5 Oct 2025 22:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lF6Cdduc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD0D64A8F
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Oct 2025 22:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759701735; cv=none; b=BclRwOWe2afohaSgpcFpcbqUcDEj/tDDM/lHgN5TxGDBp0LGyzVTctxxsQADXVH0m8s2+K0JBM+/IPyPaai05SDEBBXxbs8SjbA0eU7CtYajca6a5YEgVoFqwfMbiIdAQ2xV2Xe34WwkloLvSjH+iBg4aYo8D7mCh2C28OVwUAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759701735; c=relaxed/simple;
	bh=YgLo6dEzUPmKG0n4v0UvXEdOJ/Qo5qEUw/SfGkaorUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o5VVW7bYywZfetPr69wLO55tNPZ/Jmwhpj5qxEPw27UN+jZpvcjaYKbXmAMLKV67LovYFC3gciul/TPPFVPAc/adJiGenQ0LNdHfsTy9groUJC2S2XaMzUSlk+qhrfZj0EUbLzG7HJYNvAwxLxdNLEpWDl3Je7pgI8YsuuuVPe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lF6Cdduc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 595LgTxQ032727
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Oct 2025 22:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=N256hlAuYoC5VZZOOilDZ2b/
	UfNCJGDfOP6dgO8ecLc=; b=lF6CdducMpVUxg7v5KV2xvLDDr/WMRHAUalgLEZ7
	kLNEId6NLIuWAfWhK047h0e2/E0TQO5xAMTh8+awSmuUS37KuZSQ/MyJEKnp7PZn
	K0/MIrNdK0xbz9X4rt5bA2v1BQmG2hrxZKckDOiUEfCoZoGMKrjRdMJHdbrvcTiS
	wAW5ZGsnrRQAtQve6pOyQTX7Zqs1iGsyxYdFcP19g4LnNi110y3zaKvW91gQThcY
	rojAaBssKiLTLp3HImNDdKOoy5KuBIwQoooOcFqJ4vc5g/7l6+PDfUoo31QGmoAP
	QgsjbfQ68z1fZyNnSwpoTdPFjw5mGc877HnZN968KnS7jQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49k6bfhnwh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Oct 2025 22:02:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-277f0ea6fbaso54812925ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Oct 2025 15:02:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759701732; x=1760306532;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N256hlAuYoC5VZZOOilDZ2b/UfNCJGDfOP6dgO8ecLc=;
        b=OMTMA1yIL7hRaOtwtVWM+qeSdDaUVAaAzpwtwj/o9mmaheP90vGkCaCChRfvTnSVcq
         SF/wxXJwPWic1Y2SWizT77tGm2x/RPo5PSUGypS2bpciAcJjoZnAoazOcrpJrqQCqz1D
         5Y20tYWmLqqMPKjGuLuNOH5hJJxEhCRR/zleJKFDaDx0ZB38o7LzmXdhVp7QQj9yJ06e
         iJJaKe+NG1vTA9ZJ3U1eHPCQsKNUQwFlzd3N4q2AnINetrOD8rOcxwjuPvN50jlTBhIn
         atAD1RDKe5dtkn14pIcTkB4e/WbiTTeZzNNXTL3D5Tr2XYNHow1bjGi3HMh4ZqiFW5xH
         N2FQ==
X-Gm-Message-State: AOJu0YxRqxmqd50Gmo9ejIX4JNH7ZphJ9JMcufX35OzluDNuNxWVQeao
	ACG+aslGRAAOuXoFyiOyjzLPJACZBhu009MJV2r7o3hM15NK5zIm4Zk9miShLyYpp9niAQNcTmR
	fgIgFWjKOdDFDQyvRTGcoebKVyUcLJbWPzmE2QeJLRpde+UKWtjhKkbBiwEQCwyC0Bi11041GQF
	a0I7TJgiwIlFIAyp5kzPv0lrxdMGBIxfFIuhQysWo7V5E=
X-Gm-Gg: ASbGncux8O67gUvDnajp8XuUW9rmg/tOyUrYvijw/CrKEAXGXmOJX3RS9QJZlBVpZKB
	BgMJuu3Ms5gVunQ7duHX/ownK6iE80H1xD3jY0UJxmb5fzLA+y5W8Bg/36rSnkOrFXmhSZnMrlO
	kqGT61CKniF2j8ZmqoF3ucmULsQynYWKxEiDBoIN5I5bTv5QuzfZfVJojZvg==
X-Received: by 2002:a17:902:db0b:b0:269:b2a5:8827 with SMTP id d9443c01a7336-28e9a5441d2mr123489745ad.16.1759701731627;
        Sun, 05 Oct 2025 15:02:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEw5H3bnClwmyFijTzPlTIdJv/FoUFtpaPkBeTmanH+Kmn1x1n5CJdxzZudHkd+BA4S2ApQpqFUagP05oAcE14=
X-Received: by 2002:a17:902:db0b:b0:269:b2a5:8827 with SMTP id
 d9443c01a7336-28e9a5441d2mr123489405ad.16.1759701731098; Sun, 05 Oct 2025
 15:02:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250925053602.4105329-1-quic_amakhija@quicinc.com>
 <20250925053602.4105329-3-quic_amakhija@quicinc.com> <vsty7sy7gi2eeyifokwcqpoycmarxietkijmlkymwrmzmdsfws@x64f4ulbc6ja>
 <aaa9f760-70aa-4bee-b6ab-d6fb02ea3c78@quicinc.com>
In-Reply-To: <aaa9f760-70aa-4bee-b6ab-d6fb02ea3c78@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 01:01:59 +0300
X-Gm-Features: AS18NWCM1r74v1bXxfrsrgftusyMHXRCg5iM3xO5_k0pu2EPz6imHWWBkRHsRFA
Message-ID: <CAO9ioeWHJSj74VBR=2kHJDe_p1oG9Ngs6q9+s=CySGD3KY6sPQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: qcom: qcs8300: add Display Serial
 Interface device nodes
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com, quic_jesszhan@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: 4v5GB0mpYyYVzMGJe9knS2bDsIdBW-eb
X-Proofpoint-ORIG-GUID: 4v5GB0mpYyYVzMGJe9knS2bDsIdBW-eb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDEzNSBTYWx0ZWRfX2OX2xRtuWG3h
 dL04/kHhH6vYEE28EotSGIVjv6rqbLzqhvzqROfk8ag5NIebn8gL9UOUDWVxHGajxKyxKW4yxW+
 9Mhbjr+sa7eYrmxjqaSHuJz0QaCjbaM+xOLxglBNdoQVhD3W1aCkqvXe2oNTIhstTlpbq36sV5m
 gmf82M+CI+iAh6yadD9UKzPWm9qyI0TY0N4Q+7ihknDgeuJOgBrx8zNEnD7PwwwoSgtHGcNMg27
 mfzcs3sAxfQfHo3g7tPdB6fM9VIAGpADkvKFoC6AyarjKNKUDBbIGSf5xJwYqW2Ta2+BPjQ2tw8
 XyCGjSQzxCECxtCZAVQF3qcWkg9KnyBt9hKd92YTQLBBwwIdG/XyJ1KpYtK5mcvaUsLQVsbZ1Vh
 ZjS5D8UYSlCqGHZpUSPUwsgSInWmzA==
X-Authority-Analysis: v=2.4 cv=Hr572kTS c=1 sm=1 tr=0 ts=68e2eae4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=0nM2LEvACttjMDtNBYMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-05_07,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040135

On Sun, 5 Oct 2025 at 19:49, Ayushi Makhija <quic_amakhija@quicinc.com> wrote:
>
> On 9/26/2025 3:32 AM, Dmitry Baryshkov wrote:
> > On Thu, Sep 25, 2025 at 11:06:01AM +0530, Ayushi Makhija wrote:
> >> Add device tree nodes for the DSI0 controller with their corresponding
> >> PHY found on Qualcomm QCS8300 SoC.
> >>
> >> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 95 ++++++++++++++++++++++++++-
> >>  1 file changed, 94 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> >> index e0e1f63fc45b..834ae0522f2f 100644
> >> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> >> @@ -3,6 +3,7 @@
> >>   * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> >>   */
> >>
> >> +#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
> >>  #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
> >>  #include <dt-bindings/clock/qcom,rpmh.h>
> >>  #include <dt-bindings/clock/qcom,sa8775p-camcc.h>
> >> @@ -4854,6 +4855,13 @@ dpu_intf0_out: endpoint {
> >>                                                      remote-endpoint = <&mdss_dp0_in>;
> >>                                              };
> >>                                      };
> >> +
> >> +                                    port@1 {
> >> +                                            reg = <1>;
> >> +                                            dpu_intf1_out: endpoint {
> >> +                                                    remote-endpoint = <&mdss_dsi0_in>;
> >> +                                            };
> >> +                                    };
> >>                              };
> >>
> >>                              mdp_opp_table: opp-table {
> >> @@ -4881,6 +4889,89 @@ opp-650000000 {
> >>                              };
> >>                      };
> >>
> >> +                    mdss_dsi0: dsi@ae94000 {
> >> +                            compatible =  "qcom,sa8775p-dsi-ctrl","qcom,mdss-dsi-ctrl";
> >
> > qcom,qcs8300-dsi-ctrl. You might use three compatibles (qcs8300, sa8775p
> > and the generic one), but there should be qcs8300 one.
> >
>
> Hi Dmitry,
>
> If I am adding three compatible string for ctrl,
>
> compatible = "qcom,qcs8300-dsi-ctrl",
>              "qcom,sa8775p-dsi-ctrl",
>              "qcom,mdss-dsi-ctrl";
>
> while validating dt-binding and dtsi against dt-schema. I am getting below errors
>
>
> /local/mnt/workspace/amakhija/linux_next/linux/arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: dsi@ae94000: compatible: 'oneOf' conditional failed, one must be fixed:
>         ['qcom,qcs8300-dsi-ctrl', 'qcom,sa8775p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
>         'qcom,qcs8300-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
>         'qcom,mdss-dsi-ctrl' was expected
>         from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>
> According to the dsi-controller-main.yaml schema only two strings are allowed one is the SOC specific and other one is generic "qcom,mdss-dsi-ctrl".
>
> Shall I keep only two strings qcom,qcs8300-mdss.yaml and the generic one "qcom,mdss-dsi-ctrl" or if we want to support 3 strings in compatible sting we need to modify the dsi-controller-main.yaml ?

Of course.

> Similarly, I am getting error for dsi_phy compatible string only one SOC specific compatible string is allow.

So, what's the question? You are adding support for the platform. So
yes, you need to modify the schema.

-- 
With best wishes
Dmitry

