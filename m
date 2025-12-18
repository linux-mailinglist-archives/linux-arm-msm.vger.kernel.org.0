Return-Path: <linux-arm-msm+bounces-85667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E93B8CCB3B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 10:44:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C71573014ABA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 09:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ADE22F069E;
	Thu, 18 Dec 2025 09:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iz5OQ4l3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SOFiNYXG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C197F2EA48F
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 09:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766051080; cv=none; b=a743LnvV4LFDIndpO5tAAX30g2WXSWnnH0G8pN5NGYNc4cXyNCtgGF1XloWPnQ3pi8O0DRDo/VKLFFc+MgZi3EdFKTNubazxzPuwynuhBl8jIg46lu6bYd5VSqp0axV8V/2FTecwqolYH3XbHuL7VMf4fLfbjGX51R631d0WnFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766051080; c=relaxed/simple;
	bh=kSO39PU57qcgQaoFJiWMrPpTa2eBDwJVmdJ1iwIXf+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fs1ujcmJFFAE/dNFO/5E5Kaz1MH6jQ0S7nqillmFXuYcTFZkg3hfYvWFG2PN61Wat1m4ZqOKmzmqFjba68k7yNW/YPbSYKvDZUjKpLqBcJkTbxhja9Nu1r8xcHMfe5wijRByzN4LXxkppfIa9FklzW/uc8hRJby4edDHfvzWgpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iz5OQ4l3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SOFiNYXG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI9336Z680787
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 09:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KfGx7wI1BOPUnfcLuWP4IQEeawcCkgbgGC8no1O26v8=; b=Iz5OQ4l3Q7sUmdzs
	tJrclJCf424lFJzOQTtxkSbBx8SYavI8G5BNHvQdazjR41CjZeixRbTfO0gJkU0e
	n+osMQ7h1kaP7qPGZlzw2NJC92kuP5AnyCStsRMh9XlvZpkDSlGkW+OIo+/SWwK0
	xJa1FcsJbgfjUdScP+XSvuTutZlrX7b7imD93GQQOAWVmOGMPVLfHZt+gaGOAB7v
	4uVohZWwKu3xVhT7g3YcjNGwzn2V/k7i+I858gGsj5ZDmUUWN8Zv6gjwDD192BB9
	yUXgoHZGY6UQIj4C4o3NMi7/aW+A5NpglcE2rj63BGNPmeUoXDfqCMtNBee4Diam
	h5rF3g==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b45bhhr6s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 09:44:37 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-656ceb0c967so246011eaf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 01:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766051077; x=1766655877; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KfGx7wI1BOPUnfcLuWP4IQEeawcCkgbgGC8no1O26v8=;
        b=SOFiNYXGY9c88TBcUOQH9nd7bSzcGtdRDqfZdUqsGJuQ8s3CzbkzvKUq3DODl7Iuoi
         j8ZCPJLA/Shgatp22HHP244+bEa8q6+fj6jiVHCtavQmwfiKUqTm7LoCehRfoevk69vx
         lj/DC6wX0RXX8wIKJBqlUNM2xe5WPuJNzw84CZkMUY3HTHV0wgytRVfCjkXFz60Xdc8j
         4ShjoIlqlpoDjNCtdaQmOblCqolG1ZPVCczU6nD8kKai+JERRcaE3SgcUcT7IdYit/ij
         xG3bWkGF2RTpc7v6uUbbxbclvWHTIViEhLWmsQqSaJMzm+yTJSxzEbt0cIrRUxvMSkUU
         TbsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766051077; x=1766655877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KfGx7wI1BOPUnfcLuWP4IQEeawcCkgbgGC8no1O26v8=;
        b=k8Za2q8Dgr7QJvERwcfT8KDjgx8zRDFuA8ug3Nr6R9LEU8vyDb/xgCUZWKmDB85R/J
         XiXTaqzBRUr7Hew/s3FiNIJxc9QK2h3cSBn0ESC50HAkh1sOccnMY4qGx2ulC1qwYGYy
         VTdHiv07nyVRAScAkZj1JtqxOQb/QVkKLrdrQz7T5iofSsS5z4O9/vvcae+WJ9PeFxGQ
         dy/tcnIKzVHgbk8sT3hG9ZyJS6qpHE6t1DxPU8awN96ZGJl15kciTka+vPOvFwTX8oAQ
         QWPS5lquYkNTMW75bQlt0UGp7yoG8EjVL/f28dSPu1Z7kqkg3taYoRxs06ttt/1vzv7I
         8BeA==
X-Forwarded-Encrypted: i=1; AJvYcCWp63n0eAl+8lzR8H5AtVmiWHRfmOaGFgUYtjgpjSK9cnbeEydVEqFAJQ63TMH1OZpJFTIzTvYD5HgMLN1h@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm4bdQkN9wq6axfVXzQsNmxe07xirxL7Zpem/gr5CmIhQRjaZT
	PUP31awsNIMT3Xw8+yDLoPlyihTq+BqHfDWtvYCiDvIrxRWCsG1VjCqRbcDcK/Zw6uZ+N2Hgx1X
	q3p1D3Vr5zxEsmYb2gd4IZ1B2cQLbutj8clb1Mp0weDmRPYoJZr88x2Jb3dRbnVWOZVqCIuhEzf
	3iSbhvHKtIrTWbZdUUQ+59nViPNp6DKWSgUn+5epd8698=
X-Gm-Gg: AY/fxX73UIBlmE+XovqM7el29oY05HVLEdZrPV+Hj4Cag4EM5l+Q/wZAaoF1O6PL4lg
	wXy8scpNR1wj0e3y7ZZuBRDf+ZYjxNGk1Lpf6DEC1iFtJPxvyzUEfTimRV3ZVhYL8dvz5rlIEOB
	EHgnHT/rzhjoQB9ZoDg5lmqj0YiBym1igJjbrPELP2AlaWqn55Di+MsxEwdqD9M83hlhw=
X-Received: by 2002:a05:6820:4b8f:b0:659:9a49:8e0d with SMTP id 006d021491bc7-65b452735b6mr8721914eaf.79.1766051077074;
        Thu, 18 Dec 2025 01:44:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IERtNGbEKoDPQLE8IxnUqLmybaozyc//6YjJWrT5Q2BhKp84MiZQp4oxb5W8Rbaq50Jo7poy9dUGD8cZnIo7lQ=
X-Received: by 2002:a05:6820:4b8f:b0:659:9a49:8e0d with SMTP id
 006d021491bc7-65b452735b6mr8721888eaf.79.1766051076698; Thu, 18 Dec 2025
 01:44:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251217-firmware_managed_ep-v3-0-ff871ba688fb@oss.qualcomm.com>
 <20251217-firmware_managed_ep-v3-1-ff871ba688fb@oss.qualcomm.com> <176597111816.570337.1780092644304118894.robh@kernel.org>
In-Reply-To: <176597111816.570337.1780092644304118894.robh@kernel.org>
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 15:14:25 +0530
X-Gm-Features: AQt7F2ojmCPtN109SgIRp92s-vWGgNIdWrPbcwrp_WpHtLn1UwYz0anVJVFw0vs
Message-ID: <CAMyL0qOEzqKTJuZRuopGioZRk3DzYoeyRZjNB6JLa8yQEBedLQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: PCI: qcom,pcie-ep-sa8255p: Document
 firmware managed PCIe endpoint
To: "Rob Herring (Arm)" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rama Krishna <quic_ramkri@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Ayiluri Naga Rashmi <quic_nayiluri@quicinc.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org,
        quic_shazhuss@quicinc.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        linux-pci@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Nitesh Gupta <quic_nitegupt@quicinc.com>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        quic_vbadigan@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: _hUwq6rJcYmsPkj7qOVr7dldJgKc3WtO
X-Proofpoint-ORIG-GUID: _hUwq6rJcYmsPkj7qOVr7dldJgKc3WtO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA3OSBTYWx0ZWRfX2wYoHS4ER4nL
 ge4ZNuYBk0KfyguQ0JmiuMk+RPLMcd4XAZfOMcB/zclQ2evWSUSVjDqklmyTtL+0/W21wUuEN4x
 MVlqZwbPx5FzILCWQ7YEf+sQrGxZXtv8iR+3ubmA6YmXFnIeCOfIcQ2E9031brryFpbVk5jTyt2
 Lcj7Dyc+IpdJQoorD+Qi8+1QmLZyLOPC/WOpRbo2SZFQxLsBuaEEwSADUuArj3ZkRCm/1rOxc7K
 q5Mpb4gn7AgNygr+mhGvXaPPqdyUsGAVmaVC+sJ2nu1lqNJM0QsG+jxt9s5tATLEoO1xRfN8bXe
 g6UvGE3r39pc/ItbJFCBSoXYYH3HJiSJ1aF75dYQpr5df/YBqBhQNrGDcN0ObzBGTlPFecRvu//
 7fo8BI2ldEpiaJoa42tQIFrnMRRzKw==
X-Authority-Analysis: v=2.4 cv=SZr6t/Ru c=1 sm=1 tr=0 ts=6943cd05 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=WDKAYucIsvLUd7uitsUA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512180079

On Wed, Dec 17, 2025 at 5:02=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
>
> On Wed, 17 Dec 2025 15:42:45 +0530, Mrinmay Sarkar wrote:
> > Document the required configuration to enable the PCIe Endpoint control=
ler
> > on SA8255p which is managed by firmware using power-domain based handli=
ng.
> >
> > Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
> > ---
> >  .../bindings/pci/qcom,pcie-ep-sa8255p.yaml         | 110 +++++++++++++=
++++++++
> >  1 file changed, 110 insertions(+)
> >
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/p=
ci/qcom,pcie-ep-sa8255p.example.dtb: pcie-ep@1c10000 (qcom,pcie-ep-sa8255p)=
: compatible: 'oneOf' conditional failed, one must be fixed:
>         'qcom,pcie-ep-sa8255p' does not match '^qcom,(apq|ipq|mdm|msm|qcm=
|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$'
>         'qcom,pcie-ep-sa8255p' does not match '^qcom,sar[0-9]+[a-z]?-.*$'
>         'qcom,pcie-ep-sa8255p' does not match '^qcom,(sa|sc)8[0-9]+[a-z][=
a-z]?-.*$'
>         'qcom,pcie-ep-sa8255p' does not match '^qcom,(glymur|milos)-.*$'
>         'qcom,pcie-ep-sa8255p' does not match '^qcom,[ak]pss-wdt-(apq|ipq=
|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$'
>         'qcom,pcie-ep-sa8255p' does not match '^qcom,gcc-(apq|ipq|mdm|msm=
|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$'
>         'qcom,pcie-ep-sa8255p' does not match '^qcom,mmcc-(apq|ipq|mdm|ms=
m|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$'
>         'qcom,pcie-ep-sa8255p' does not match '^qcom,pcie-(apq|ipq|mdm|ms=
m|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$'
>         'qcom,pcie-ep-sa8255p' does not match '^qcom,rpm-(apq|ipq|mdm|msm=
|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm)[0-9]+.*$'
>         'qcom,pcie-ep-sa8255p' does not match '^qcom,scm-(apq|ipq|mdm|msm=
|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+.*$'
>         'qcom,pcie-ep-sa8255p' is not one of ['qcom,dsi-ctrl-6g-qcm2290',=
 'qcom,gpucc-sdm630', 'qcom,gpucc-sdm660', 'qcom,lcc-apq8064', 'qcom,lcc-ip=
q8064', 'qcom,lcc-mdm9615', 'qcom,lcc-msm8960', 'qcom,lpass-cpu-apq8016', '=
qcom,usb-ss-ipq4019-phy', 'qcom,usb-hs-ipq4019-phy', 'qcom,vqmmc-ipq4019-re=
gulator']
>         'qcom,pcie-ep-sa8255p' is not one of ['qcom,ipq806x-gmac', 'qcom,=
ipq806x-nand', 'qcom,ipq806x-sata-phy', 'qcom,ipq806x-usb-phy-ss', 'qcom,ip=
q806x-usb-phy-hs']
>         from schema $id: http://devicetree.org/schemas/arm/qcom-soc.yaml
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.kernel.org/project/devicetree/patch/20251217-firmwa=
re_managed_ep-v3-1-ff871ba688fb@oss.qualcomm.com
>
> The base for the series is generally the latest rc1. A different dependen=
cy
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your sch=
ema.


Hi Krzysztof,

As per our discussion in V1, you mentioned dt binding filename must
match the compatible
and I should rewrite compatible to match filename.

V1 discussion: https://lore.kernel.org/all/CAMyL0qO2FPBe7N6Q=3DhW-ymeiGDhAB=
sU+VCj25jzcoQRhBoWbDA@mail.gmail.com/

So, I have changed compatible to match file name and it seems like
dt_binding_check is reporting errors.
As compatible: 'oneOf' conditional failed.

Can you please confirm if I can use previously used
compatible(qcom,sa8255p-pcie-ep) and update
file name accordingly as even in driver we are using this format for
other compatible.

Thanks,
Mrinmay

