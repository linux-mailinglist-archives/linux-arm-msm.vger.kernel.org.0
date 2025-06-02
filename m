Return-Path: <linux-arm-msm+bounces-60029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD60ACA98C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 08:39:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B7D557A20B1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 06:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3775419CC29;
	Mon,  2 Jun 2025 06:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c+2fSjoF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7DE189BB0
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Jun 2025 06:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748846336; cv=none; b=qGI245vOsBgOJzfqQIVAac+cTi7CIun32Im2PRvnpYPEwsEEE7KlaSOH9P/FT6mmj8spd1x+BKxC2YQud18AlzjlZacUzJj+eikZ/5ksvI5n60U2uB2hBP/HBvwNKZ5Fvqp5jKYVCLieth+Qf4LUgDo40S2ONWruVtbFWaX+cHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748846336; c=relaxed/simple;
	bh=H+8hGcc842VAoSFMkYka2oWdV8tk0M9H+OQ/c5+ATvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ooaYjP79+fMrIT7aWw8sn76RR6X1W0Lt+e2IvZ9X6BJ2fuYjAGsz7z9zzHmnBzWWtmKkhZ+CcS+35HlUmC5E7ZmHfOJiE5SwF2UzepHXD/fVQ9vcGr8mPEjO5a7LOqrY0fGQCe06ry0VafwmYM7ZCMJG59uondoSZzDVL2f2pNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c+2fSjoF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 551MAmJk009412
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Jun 2025 06:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hgWpVsIqocxgnFNmFrMMXpBx
	7pW8ByX+8nWPO0pYioI=; b=c+2fSjoFh7WeBjQikGYXsMtaxntSzjiLRWVr0Ujr
	bC46VWaexDO2BlDRU2QMNVLfLXw98WJ8XcONky5QbZha/BhapV4fUfN8eQMWTb9y
	AaKk8VA2EbymeOFGfxPN4+6BieDeXGdpxBW6KKmf/ThOLaHd0tlT3y8E1+rE7fFD
	z7SXJNkGkUG4M47vm4cyC6jAUhodtw8W+Gmq37F1PdHjhI65yO3jxqtgRU5Shlln
	p/Q7jm1qkqXsGM2asyaXvgIvj/MTi0aUGCDz0zt0VCWvNcHMI7IcWTCI/JrNsCiP
	2C6hhkHJWHzmcmp7/M5xaMBGBMlo2Z+irN++40giZsLuHg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytkw3kac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jun 2025 06:38:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5d608e6f5so1100163085a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Jun 2025 23:38:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748846332; x=1749451132;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgWpVsIqocxgnFNmFrMMXpBx7pW8ByX+8nWPO0pYioI=;
        b=ihLksic+AV0BUx9PGp/n/Xjtd3/dwkPYUl+Aml6xxvBUR+BD81YxVNjaMKH+nyLaIo
         RIhJfFwtQstFJpFSjvLWC+1+TG4Tx6QIP9/WHpA3Sz2UTCGFlA1VO6m3H/gjj/33jxDO
         hKHC5VwRrzlWlIrll3clEqhNTw8/LwsZOrPz/QVwdmUMSMXd3n62mYge9Xax4pRhQpUS
         lUC55ngT0F6wNYJzMpl0zbsfIf0eWShT7/8rDbddjIiQMt2bQ3D74m/Ri6DPwu74A5Dp
         9yfGOqR1N1drdxqLaJgy/tmojlbG2F3sSGoGCzWH2QJLTF+B02C6XfgmNl0jtfH14/Mo
         e6BQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRgkIyI3TDiNhD2FGDvTDl3EdyPoFPVMwA9HWHD1QQQZqHn/SUYKTcIvO2UiwELjh4QGcUVjYu/nhhUXDA@vger.kernel.org
X-Gm-Message-State: AOJu0YxpbXtfTBnQSepwI9jfPmCWVMcvgy1O3CNmen89JqwUzZsenJ3t
	s7fVaiXbxkTjEf1j3CeIFpvD5q5y+flsZqwh1IwN0K6GVcIdate3vgNw4ncr9XKxiZMUe81s+hL
	ghnhJTpt32gske1kw75wpQ0ogLds9VVnT2GLKb8YCj2gWDYjyZaBGILNrxw28SQXdVjMk
X-Gm-Gg: ASbGnctwUvFxpJX3NQ9NguEbFXSwNqXEXULkwB7PCg5e+bQRUKkIdV0sMGZCENSluTF
	b+mSOod8Q7fcqriuj0EzVwZp+pOxetqK8FOE8Ww5xVFlmc5dq1Y75O8+cgtR4SHE0Dh8s0WZ5Wz
	TO624QN7nxaK+QR7o+d1Kh+F8y6RmaOtzZhujxSPv+BQbG/QJl/1PgnC/RUV0tGopqjqB9+BNN7
	5LYdP00DN/7w8anfmSeO763uwyNFJ1xoiTJI6fAm5TtZBgJJx2/9njvUt24gsMdi2xiqw5hnq6b
	Jg4wlJ6YqDW2MTB8EjvapUgcN3/XBP16Bk5dzLqQqh1UU0j2SPg/k9Sle0Q2kpDjAOOJiWj89k6
	R/jAl7PnUOg==
X-Received: by 2002:a05:620a:31aa:b0:7c5:3d60:7f91 with SMTP id af79cd13be357-7d0a4aef53dmr1398543885a.15.1748846332383;
        Sun, 01 Jun 2025 23:38:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAH7lHJMHtm+wUmKQxUSIBCKgWZpMZBY9hHwWCQqMr0n2nY53V40/nig5MZ05K/Bkx/ImbsQ==
X-Received: by 2002:a05:620a:31aa:b0:7c5:3d60:7f91 with SMTP id af79cd13be357-7d0a4aef53dmr1398541485a.15.1748846331792;
        Sun, 01 Jun 2025 23:38:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553379378easm1498469e87.240.2025.06.01.23.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 23:38:50 -0700 (PDT)
Date: Mon, 2 Jun 2025 09:38:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: fenglin.wu@oss.qualcomm.com
Cc: Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 6/8] dt-bindings: soc: qcom: pmic-glink: Move X1E80100
 out of fallbacks
Message-ID: <mdxfitbkyfwt7efjshygpjvg3s6mvlq75sa6hatk574iocd2nx@kvn2o66nppih>
References: <20250530-qcom_battmgr_update-v2-0-9e377193a656@oss.qualcomm.com>
 <20250530-qcom_battmgr_update-v2-6-9e377193a656@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530-qcom_battmgr_update-v2-6-9e377193a656@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: fLYYvEhJJWggCkBzhDhVEfoqO3afPl17
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDA1NSBTYWx0ZWRfX1mCvOqBpmmr1
 rEruUymFljqKLiXF2179NcaXw3JWX/68PYiIP4vKCTIeM04kWu738Z1tkOhkMqSZZDEyhGZzpD5
 oWX4Hp2fXk9o/jaXfUY84QUqtelCQVY6ySZs35Jn67jMOBTtinrLmlqsIOHvADMG4KcjJ1j6Qmq
 uTfqQVgRgirXT9bcOfcVZIxGyQLVtd97o5w76VGqL7mHFQJ/p9nLwtyELDYOUvgJTiOZ4A9ZkkE
 qqNnDYfdN0v0sMs0J7OTPvOArqvL3SSmx39lRL1WSKeMFAAXiaRyJRNqO50IKf8mftUpj41icWh
 N6DgpjBbkSS4TTSkxoNrt+M+oieZHLgobDYjz1U9+b+kFS+CKVOCO6+Pm5AgUv4Y8eJan8eyUQa
 0EEp5Kzung8lOO1fqoWO6mthc4IrTZKCSpnaKmItkUDTxbQyB4S1PXfR8l/dh65meh4riksd
X-Authority-Analysis: v=2.4 cv=WI1/XmsR c=1 sm=1 tr=0 ts=683d46fd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=EhlfILWT9FdnabWGdsAA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: fLYYvEhJJWggCkBzhDhVEfoqO3afPl17
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_02,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 mlxlogscore=834 bulkscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2506020055

On Fri, May 30, 2025 at 03:35:11PM +0800, Fenglin Wu via B4 Relay wrote:
> From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> 
> Move X1E80100 out of the fallbacks of SM8550 in pmic-glink support.

Why?

> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> index 4c9e78f29523e3d77aacb4299f64ab96f9b1a831..972bec151118f2e20e1f3b4e0c0a8fbbbea7ab90 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
> @@ -39,9 +39,11 @@ properties:
>            - enum:
>                - qcom,sm8650-pmic-glink
>                - qcom,sm8750-pmic-glink
> -              - qcom,x1e80100-pmic-glink
>            - const: qcom,sm8550-pmic-glink
>            - const: qcom,pmic-glink
> +      - items:
> +          - const: qcom,x1e80100-pmic-glink
> +          - const: qcom,pmic-glink
>  
>    '#address-cells':
>      const: 1
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry

