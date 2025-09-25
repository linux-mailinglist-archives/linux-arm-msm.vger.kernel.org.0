Return-Path: <linux-arm-msm+bounces-75215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2547EBA1B73
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 00:00:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8B113B32D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 21:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D1A2D6E60;
	Thu, 25 Sep 2025 21:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dmXVCM11"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E720023D2A3
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758837592; cv=none; b=VmB1n1J57KjEuT/Fb6C3Cee1dYYBlYBavspUrwFnSKnYOIRqPtRej/eGPBiup6d/oS9apmi+RwQXoD7Z70GwiWr/M62egoxvnQARsGB93G2m7VUA220ET//1pxSgDcN1QQvbGGSiSwonjVI+sWwsjIovn0ZdY30ggh/nr7oQ0IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758837592; c=relaxed/simple;
	bh=zQb+dGtMb2u6KWUTABuTq2+gnHyg2j9x5k8jyapv30M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EtaSk+zvEgGmFIMwa4MlNBfY5qzqeGydy6cELkgQMgUahd2F3q7xvGHnoDfN1CfN1PRLTuUzVMmONsF3WABTn/SAoyV1SxxjfMDulzs3PZTLH+3KiGo0cQ2t6uQcktzccZCLJc+wSDBdSGGELbGVEIufMKk+FczmLle/G5AaXgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dmXVCM11; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPgnn021563
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:59:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BR5HUPeCfft1NCbbIet3qxND
	5IfQR5IsgBoObFi2Je0=; b=dmXVCM11cDQ/e7iP/aeOEcPaRINrPzjAhfS2OeIL
	Zv8rCZjqsL/dC2KHqPEY4C/OREtV7GtdvP5RKd3Wy3qDPVVf1Wl8+XxJlbvl0o0b
	cd4e4PA1y05OrXAk6+NWW0R44IiPaluKPmNUuxNIXWNHxEwZR/XDNabMBsFhZNLO
	ZDHDaDCkUmjjQDFz+7W1hlk4ahxeoVaW8KVGE27VbvKox82+mY9I1TZGPD3iP9Ij
	6cJxPGdzy8FzkREB2oGpXimWlXwdQzdCk5A2lUQTPea38qi5wTpfFn6SchdLWE9f
	iQWRal0RDRoP4msoWLPjpWeQA/f4KIBUK2D97k6EteWklg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0qrgw7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 21:59:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4cce66e91e3so48200811cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 14:59:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758837588; x=1759442388;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BR5HUPeCfft1NCbbIet3qxND5IfQR5IsgBoObFi2Je0=;
        b=TQEHqKNGzJ4/UuLRsu7aTlj1azXluHNgfDVkW6E8IxIa7ZfXtyYbSVk1SoDyt0LhaM
         3RmQ0QoPKRlflM+c44JZJwfvNJPcE+KJwdFKFvk2AR5YLGv3tE61OIlCiEsvMlizBOhQ
         fs6RMjUpNhPrDBy2Bqh1HO3Wtn2tYXJMToVAWh9QX2DSDxRnSZROysUzY/sy9CpyhzV6
         yYMFKAsRYaMlt5KwabBDRcP24ZQ3xSErtWwZomrK6nZYDN7ez0IxSO191HmEknJ2AbAR
         +znKYszbCbeOjnUxzsi5krXZhsITTjwqlrZ9JT69moR1jHQE53auIPzk55+KWHVTwp5j
         V8Fg==
X-Gm-Message-State: AOJu0YwGVDGGRv9wt3Pe63Rh+4wOBgUz3WNlJOM8O26h264b3gsuWs09
	FfbrtMToBy4OeMnDqYbSKQGrXDooYLi3iJvWX7JsMMqYdEFyEiGneawIk/5+RUHETxn6Xjk/k5Q
	u+JxVCrt46RADke9Gpk5tBAKiiktzCsX8NpffoxWHL33u+P4zMEiTrd4SJfcn0hUqIkrh
X-Gm-Gg: ASbGncsd6UcQTOYsD4aiHd7iWYyLKrx95+WRsluf/VsTG0OvdsETASRHsRc9qUplFOp
	VaA6eRGP2bT4haYMiK3nWkmAu+jiOq9GpMv5YuqiYXF0alC4kM9hcOFDnrLaJAymA/A7vhBeUUO
	OEr0Mf//spR0KBOB1CGtj4HT6GkwJ9C7TtKMeX6cEfXzJVjDVoa1YmOSgXEDK0qJX0Cn5i3sk7s
	lUtlatVbLyQztBF2NEr0tDKA1skawlbbU5VP4O5nLRwyZFvLz6qUlWBR4r6oM4BpOTCEbCrgtSa
	9IMh8sLG60ujWNik0r0iVBzDDp9u2q7r/+dyLrUAhzFG8tqdn01fDok/xi4KMRibsmkZVKQXqgn
	zFGUlOEML/WxnT6ZTq3X0tSbSoNiaOhhkehlvjMw8A0DZsJeXfbso
X-Received: by 2002:a05:622a:1cc9:b0:4b6:3451:a159 with SMTP id d75a77b69052e-4da4b80882cmr93562331cf.49.1758837587725;
        Thu, 25 Sep 2025 14:59:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPiYBr7KbUyHOeG6VWHRGxMxNAqbYyBxg/ol3QRzwFxfVNAh47tngb7nHx6SI96PgsExBvVg==
X-Received: by 2002:a05:622a:1cc9:b0:4b6:3451:a159 with SMTP id d75a77b69052e-4da4b80882cmr93561991cf.49.1758837587291;
        Thu, 25 Sep 2025 14:59:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313431070sm1170275e87.12.2025.09.25.14.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 14:59:46 -0700 (PDT)
Date: Fri, 26 Sep 2025 00:59:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: document DSI controller
 and phy on QCS8300
Message-ID: <zjjnizyz4gj5z242dhgwgvxk2pkxoyhchcicwbbzod2m6z6mx6@xjapoj6goo47>
References: <20250925053602.4105329-1-quic_amakhija@quicinc.com>
 <20250925053602.4105329-2-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925053602.4105329-2-quic_amakhija@quicinc.com>
X-Proofpoint-GUID: d7budwSMDY9U3QFqVSAFiBOvXO-8UdEl
X-Proofpoint-ORIG-GUID: d7budwSMDY9U3QFqVSAFiBOvXO-8UdEl
X-Authority-Analysis: v=2.4 cv=api/yCZV c=1 sm=1 tr=0 ts=68d5bb55 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=9Lg_u9sHXrgwa_hBAsgA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfXy6QnCMLdxnqV
 Y1gCyRjpMVNp+nekrbUAT7AH/hYegTyhvMxkD1cUjZLS8HiFu2z8dX1Dx36r28mt3ChYhP9QOGK
 eFKpTXDr17uJMnpZftoIXrZzz6a/QwEvqx0Odj644YHabmEhuGZkVIVvOV+GmL7tX+2B8U4Otul
 RSTa3Bp8WMx0EQuywyIXxCPRUPYaO8GCY4Wvrdjd0vQ/AG1OyX63kAb4PKXP0ocZkVFMaSL55AG
 UdDNDVYgL3+cWEpJxJlbcRXnVQg1OSxHPehqXbeXDz0ZQuv1YoeUZCFnNT4KEpdB+iOxYBAurtX
 0B752ncl0SWToiI97bCeZdY5WUbCuPEUA4mzKYceXacMNCZNiWbAaBHpkuxbVtLnuafxVfYZ+nT
 fiRMRmDmYDHBAdws2p3Xy5CyUoeQ2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_02,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On Thu, Sep 25, 2025 at 11:06:00AM +0530, Ayushi Makhija wrote:
> Document DSI controller and phy on QCS8300 platform.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  .../display/msm/qcom,qcs8300-mdss.yaml        | 100 +++++++++++++++++-
>  1 file changed, 99 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
> index e96baaae9ba9..f34823ed4433 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,qcs8300-mdss.yaml
> @@ -53,13 +53,23 @@ patternProperties:
>          contains:
>            const: qcom,qcs8300-dp
>  
> +  "^dsi@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +    properties:
> +      compatible:
> +        contains:
> +          const: qcom,sa8775p-dsi-ctrl

Why? It should be qcs8300-dsi-ctrl

> +
>    "^phy@[0-9a-f]+$":
>      type: object
>      additionalProperties: true
>      properties:
>        compatible:
>          contains:
> -          const: qcom,qcs8300-edp-phy
> +          enum:
> +            - qcom,qcs8300-edp-phy
> +            - qcom,sa8775p-dsi-phy-5nm
>  
>  required:
>    - compatible
> @@ -71,6 +81,7 @@ examples:
>      #include <dt-bindings/interconnect/qcom,icc.h>
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
> +    #include <dt-bindings/clock/qcom,rpmh.h>
>      #include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
>      #include <dt-bindings/interconnect/qcom,qcs8300-rpmh.h>
>      #include <dt-bindings/power/qcom,rpmhpd.h>
> @@ -142,6 +153,14 @@ examples:
>                           remote-endpoint = <&mdss_dp0_in>;
>                      };
>                  };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    dpu_intf1_out: endpoint {
> +                        remote-endpoint = <&mdss_dsi0_in>;
> +                    };
> +                };
> +

Drop extra empty line

>              };
>  
>              mdp_opp_table: opp-table {
> @@ -169,6 +188,85 @@ examples:
>              };
>          };
>  
> +        dsi@ae94000 {
> +            compatible = "qcom,sa8775p-dsi-ctrl", "qcom,mdss-dsi-ctrl";
> +            reg = <0x0ae94000 0x400>;
> +            reg-names = "dsi_ctrl";
> +
> +            interrupt-parent = <&mdss>;
> +            interrupts = <4>;
> +
> +            clocks = <&dispcc MDSS_DISP_CC_MDSS_BYTE0_CLK>,
> +                     <&dispcc MDSS_DISP_CC_MDSS_BYTE0_INTF_CLK>,
> +                     <&dispcc MDSS_DISP_CC_MDSS_PCLK0_CLK>,
> +                     <&dispcc MDSS_DISP_CC_MDSS_ESC0_CLK>,
> +                     <&dispcc MDSS_DISP_CC_MDSS_AHB_CLK>,
> +                     <&gcc GCC_DISP_HF_AXI_CLK>;
> +            clock-names = "byte",
> +                          "byte_intf",
> +                          "pixel",
> +                          "core",
> +                          "iface",
> +                          "bus";
> +            assigned-clocks = <&dispcc MDSS_DISP_CC_MDSS_BYTE0_CLK_SRC>,
> +                              <&dispcc MDSS_DISP_CC_MDSS_PCLK0_CLK_SRC>;
> +            assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
> +            phys = <&mdss_dsi0_phy>;
> +
> +            operating-points-v2 = <&dsi0_opp_table>;
> +            power-domains = <&rpmhpd RPMHPD_MMCX>;
> +
> +            vdda-supply = <&vreg_l5a>;
> +
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    mdss0_dsi0_in: endpoint {
> +                        remote-endpoint = <&dpu_intf1_out>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    mdss0_dsi0_out: endpoint { };
> +                };
> +            };
> +
> +            dsi0_opp_table: opp-table {
> +                compatible = "operating-points-v2";
> +
> +                opp-358000000 {
> +                    opp-hz = /bits/ 64 <358000000>;
> +                    required-opps = <&rpmhpd_opp_svs_l1>;
> +                };
> +            };
> +        };
> +
> +        mdss_dsi0_phy: phy@ae94400 {
> +            compatible = "qcom,sa8775p-dsi-phy-5nm";
> +            reg = <0x0ae94400 0x200>,
> +                  <0x0ae94600 0x280>,
> +                  <0x0ae94900 0x27c>;
> +            reg-names = "dsi_phy",
> +                        "dsi_phy_lane",
> +                        "dsi_pll";
> +
> +            #clock-cells = <1>;
> +            #phy-cells = <0>;
> +
> +            clocks = <&dispcc MDSS_DISP_CC_MDSS_AHB_CLK>,
> +                     <&rpmhcc RPMH_CXO_CLK>;
> +            clock-names = "iface", "ref";
> +
> +            vdds-supply = <&vreg_l4a>;
> +          };

Wrong indentation

> +
>          mdss_dp0_phy: phy@aec2a00 {
>              compatible = "qcom,qcs8300-edp-phy", "qcom,sa8775p-edp-phy";
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

