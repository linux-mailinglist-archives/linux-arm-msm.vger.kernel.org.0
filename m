Return-Path: <linux-arm-msm+bounces-108672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFvNA9aHDWpdygUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:07:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DB058B583
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:07:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6713E308EDB0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A43353D3327;
	Wed, 20 May 2026 10:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UbvoVKIx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LywJeMGb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93BF3D2FFC
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271287; cv=none; b=C+UlSA8zouFAMx0kbxpoUoOxcO+pWlcFYOSeCeE31Ud2iCVrv1ftmZGGC2vAPzfaNz4hAUcNHOw4+ff5f9sipd3XP0qs6/kqhENmd91Zc2YTquC1CduXUXKeY431LA/XtKwWQaYi8FbP4no1RrSmzYx4cf4uFC1fjR7FQxDLsA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271287; c=relaxed/simple;
	bh=vmfiAM6t9g85B4wTeavLutgdJmjQ8DwXDbuj4/5wtWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HTvt720eXQgbZRBfvTwQ3OOlof0SGyK9UsT26MIi9B1C3UxfPTYc+H/jqKbh5NM5fHz7lSZxNGfxgnhCysrAJW3y29C+jWsrXu6iH6gggpwqMxxeRLlfm7kZAEbRdPnRLpP6dlwC0cCqdJ8EZEoa3KgdpqmPgXqJE/lHFybp/UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UbvoVKIx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LywJeMGb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7OlET341433
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:01:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B3C1pz46TF7EHcIOJMpu/WwJ
	O4LBgll2RsOEX4nsprA=; b=UbvoVKIxzTzwbQCPxC7gsotpNPgW75B7myi+nsFT
	JaE0nCg2U4nFoRG2y4AVv+315MIpPUTUX/dUvqylKhCK0KkKXxdWtX2qpFZl6Dpm
	ynCqSjxrfD5s/Wi0M+PqhH+43EtjrTDq3MLbnr/BSXv+uOWtdSWHhFhEJEiubdf4
	pjaNfAjHImRIiTJqJ3AMlqHqlhEQmn7IHxu+RY9AHHSSE8DPhj89fjtxlRB5O2BS
	1zAnYoJCimoOlt4STa3oulrBqxIZyxjAQLULq7i2Z93ylCWqyF/lKm9udGUSbqtk
	8WGjRyh2pi5BiXn9k/NUmqj5h5BTVrZ6iw0qQVtaX3Aryg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3vc5b1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:01:24 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e5681f8f12so7051776a34.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 03:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779271284; x=1779876084; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B3C1pz46TF7EHcIOJMpu/WwJO4LBgll2RsOEX4nsprA=;
        b=LywJeMGb0ZR3GD6rhwhSSVyreBEOSTVOGenh8hV13z9fI/GP+gEklQYHt3DiB/8u4o
         WsCj6SsDeea2B37kNk43UAhO+lMryLvKGsuMNVaIExdKpi00Dsb8PnRa5SAS+vBxwrxx
         zw4UVMxYDghHLx7G4bo1HwYA6BZvZcGD278C89dfgWXeMDO4DuHG/i1jEiNdxvK4AIAk
         Qs2uTjNKi/DS8C4UMTims22ypVvgqjlgylpgrnt3Ly6s8mW/oxjr+LmyR9p/VltK4/ld
         25m1VSOFVx0CRIuyXNziAYmv8Y5E0BqU53pIDNtUlzCnBbe9hFdUmT+g/xDYxzjSPeyX
         37OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779271284; x=1779876084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B3C1pz46TF7EHcIOJMpu/WwJO4LBgll2RsOEX4nsprA=;
        b=RPku6GwVlTReTdfNzbT3GtZCYF7/CP7Zj7OvBFuYHZ+cvFJES5ajcZx+iNwkA61cwL
         XYibPvCAKcusdCqgAY1ZDIpx4726rWziqIg5ll/pjfqVveRn+sk5Yixz0wGmv56latJX
         5uvQ75IRB+d/KEYU4s8MWp/wHOnmJ2wT9WT8ModTtFI2okzeHBPQP3am2hv/bQxsuOJr
         Ihv2KiOUxsESs/iLKxKjuRhS1hETG4e3nADic8sj2fCGsvcRtDOt0YqNpJlCQMXTeUUj
         0duKjsiEYzkhX84gitcpT1q798y1VmizoHlKmRx6/vs9xvvEwB/LjMYVO+RfYMOaxipK
         6msQ==
X-Forwarded-Encrypted: i=1; AFNElJ/34noNn3YlckkPXroP5k4yLMcDpBm2/Mc9rp2Rzhd1djbX1PMc5ZS4/lMLvGh8Y6dfYqqcYfVj673VkNfp@vger.kernel.org
X-Gm-Message-State: AOJu0YxzC9vi55CajSDyXBMSWRjITxlpbrw19Xzpmgz219OMxZIJD7q9
	iX/XpMCeTWGiu3uvlHAj0Cxe6ifBsVdUm1MSVtNOCqPET706Fkd7BLYuSdv+FeXslOBYLayihcn
	c721UfV9aLKd89pkFtuvjURSTGMoW0fv3Asy8MbYgd9+6NltKoX4bm/oZ0k+V3lMwC/a9
X-Gm-Gg: Acq92OEK07ctnndCkbzehFXgvPwhtnqpagLXl6dHBmakuNf5/4vztD8yVN58CbV4TMv
	cwBAcPy8cVe99rIP8boreodNMQUJcu3jK6bcFj43DDEUKwHkRIqveL/RQq+weviuEQKXX0DqRQ6
	pTfwZjI2BvqyU3R2Oza3Uc6+VWvzQfE4QsQS7JVv8NEnhf3yDC6CIq2sq1gxpY8WIAof3u6IjV4
	WGUKm6bHu7NqOmHrS/qU+Sivlzja81UIptI7Iw/01A9EofWryWi1+8f7nQhibry6ioWA0NY5qTt
	gQlqg5S7+308rNxUIUwzpo+4zHQDNjO1HWlOLyYNvCObNn4QvCyg0Wb1Kv9FzxRDUACy7WBedl7
	m79SAVV3LkTs0w0N+FIUlIy7mRJVGID5/0RHZYdLqKSzbMmF4doURQHkpxzUtqseFjCF5y0pti3
	f1KlTYCRJ7n4tUqmMPQQOJa4jZIE3r7wZcoTA=
X-Received: by 2002:a05:6830:610d:b0:7e3:d7d6:a4b7 with SMTP id 46e09a7af769-7e4ea0319a0mr16222970a34.3.1779271284021;
        Wed, 20 May 2026 03:01:24 -0700 (PDT)
X-Received: by 2002:a05:6830:610d:b0:7e3:d7d6:a4b7 with SMTP id 46e09a7af769-7e4ea0319a0mr16222938a34.3.1779271283621;
        Wed, 20 May 2026 03:01:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a7a0sm4778570e87.24.2026.05.20.03.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 03:01:22 -0700 (PDT)
Date: Wed, 20 May 2026 13:01:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: typec: Add Cypress CYPD6129 UCSI
 controller compatible
Message-ID: <w7xunralidmy3lntzlmr7zfkhdifbp2y6lf4z56ssliyih7nae@gx32fjexuzkl>
References: <20260520093902.2064730-1-akash.kumar@oss.qualcomm.com>
 <20260520093902.2064730-2-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520093902.2064730-2-akash.kumar@oss.qualcomm.com>
X-Proofpoint-GUID: V3E5ebu4CgJL0HtQqPvrbnn9UIlpYNs-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5NiBTYWx0ZWRfX+GmqNElgExkx
 57rU8+YRZF7tsZkq0UZP/QBDLDc45wR9NRa7yKMNkE+ArPkEHrSKP4XQXNqFehO0ut3GFL61Sfx
 3B79aIfPV5T5cBtj2HkJOtcl8s9k4aNGjhYaDgVYLX5Jb1gmWeAb8JGeSnJtjQ/izQY589FERmD
 f91+jCKfVu2/z9m0qEbxBijVH2VaJtWfQD9oV+72u4tKkFy33zXn/hLrd7e2xB85dDln7n6s6Nh
 tsnrCNzWKhW3CElOGOw+pL9lQ/hvMgamCnG89sEbUepBg7313rLcfcQYAKX8HLS4wfdfXeyhaRe
 nSOR8TBbvFyXjpRfpcTJNy6bbx1NPWZkmRp6nxktLEeXQkKBT8NZ6QQMNlR7al9fv2J8UGw7DKF
 +Zkm01hfg1zvMnWf6WArCkgq2aIUufSf6lu/V44/Jl/xGSoYGRBy6ArkBpckhheQZOwU70/RyuN
 XCRaeMsYaxHTgT/Ma+w==
X-Authority-Analysis: v=2.4 cv=JuPBas4C c=1 sm=1 tr=0 ts=6a0d8674 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=81s-UeQjukf3pHKFtO8A:9 a=CjuIK1q_8ugA:10 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-ORIG-GUID: V3E5ebu4CgJL0HtQqPvrbnn9UIlpYNs-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200096
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108672-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.8:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,0.0.0.0:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 89DB058B583
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 03:07:32PM +0530, Akash Kumar wrote:
> Document the "cypress,cypd6129" compatible string for the Cypress/Infineon
> EZ-PD CCGx UCSI controller.
> 
> The CYPD6129 is compatible with the existing CCGx binding, so allow it as a
> valid compatible and permit the existing "cypress,cypd4226" fallback where
> appropriate.
> 
> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
> ---
>  .../bindings/usb/cypress,cypd4226.yaml        | 73 ++++++++++++++-----
>  1 file changed, 55 insertions(+), 18 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> index 0620d82508c1..90769c43ac95 100644
> --- a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> +++ b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> @@ -15,7 +15,13 @@ description:
>  
>  properties:
>    compatible:
> -    const: cypress,cypd4226
> +    oneOf:
> +      - enum:
> +          - cypress,cypd6129
> +          - cypress,cypd4226
> +      - items:
> +          - const: cypress,cypd6129
> +          - const: cypress,cypd4226
>  
>    '#address-cells':
>      const: 1
> @@ -63,10 +69,42 @@ examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      i2c {
> -      #address-cells = <1>;
> -      #size-cells = <0>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        #interrupt-cells = <2>;
> +
> +        typec@8 {
> +            compatible = "cypress,cypd6129";

What does this example bring here?

> +            reg = <0x08>;
> +            interrupt-parent = <&node>;
> +            interrupts = <GPIO IRQ_TYPE_LEVEL_LOW>;
> +            firmware-name = "ccg_primary.cyacd2";
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            connector@0 {
> +                compatible = "usb-c-connector";
> +                reg = <0>;
> +                label = "USB-C";
> +                data-role = "dual";
> +
> +                ports {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
>  
> -      typec@8 {
> +                    port@0 {
> +                        reg = <0>;
> +                        endpoint {
> +                            remote-endpoint = <&usb_role_switch0>;
> +                        };
> +                    };
> +                };
> +            };
> +        };
> +    };
> +
> +  - |
> +    typec@8 {

Ugh, definitely not. The default here is #size-cells = <1>, which is not
suitable for I2C devices.

>          compatible = "cypress,cypd4226";
>          reg = <0x08>;
>          interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
> @@ -74,20 +112,19 @@ examples:
>          #address-cells = <1>;
>          #size-cells = <0>;
>          connector@0 {
> -          compatible = "usb-c-connector";

Don't mix cleanups (whitespace changes) and sensible changes.

> -          reg = <0>;
> -          label = "USB-C";
> -          data-role = "dual";
> -          ports {
> -            #address-cells = <1>;
> -            #size-cells = <0>;
> -            port@0 {
> -              reg = <0>;
> -              endpoint {
> -                remote-endpoint = <&usb_role_switch0>;
> -              };
> +            compatible = "usb-c-connector";
> +            reg = <0>;
> +            label = "USB-C";
> +            data-role = "dual";
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                port@0 {
> +                    reg = <0>;
> +                    endpoint {
> +                        remote-endpoint = <&usb_role_switch0>;
> +                    };
> +                };
>              };
> -          };
>          };
> -      };
>      };
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

