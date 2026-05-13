Return-Path: <linux-arm-msm+bounces-107247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LiOFdJKBGrNGgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 11:56:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5808C531025
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 11:56:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F2B313099434
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 09:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 221C43EFD24;
	Wed, 13 May 2026 09:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a/Us1Ino";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L3k/8uK0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87243FA5E7
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 09:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778665451; cv=none; b=jz9h+AgnVsJPqjOvLnVCqrIK0hkeaEWk1xGKTv6noKLPAAR47PC773dXgW1fbJkpwKnbnDZPrZnWrmiPb8VDC1PYdm6Y431BM4W16tpupT+Eykr6VBktMsTksLo3ptOd+Qdg+ws68tM9DEOVRfqxSp2cSmXcZvQlqcV/doieNUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778665451; c=relaxed/simple;
	bh=PNjiji/ryMz6Wi/3/P9uB7M9klgp5B7XZAWK988RVbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b6jt+QV7caPbEk3mzukHKHMYYUP+hBMqx0Os9YZzhhVZpR1SsDk2eB2m8bUTmpYJgNXrPZ6cE1Zf3nxMnVV7Oque7CreWFcE4qGV4WBqmJt2np3Y/7HudndjCuhGV8qtAjLs87vuk5EYKGcIiK7euMrDArXUxvSfGyN6b1odGgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a/Us1Ino; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L3k/8uK0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4p6Xk2338787
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 09:44:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=l3LZDvSQIk1yYdY+57/8y83u
	kT6k6LZlb+xTzsHJqWY=; b=a/Us1InoiHoDjDzDYKrVJzu24Wrpv0YNKCBl/eYK
	s/Fr8eztDR6QC+CKgdzwoghFRLO6vS0RgW/DZo1yidDOQFtQBuzpt9hFGB1pwfxU
	iUQ4GeHx6oTO+qPF3x/FhrdqwBHvMYBM88orctQd+XxLFY8CFAHY223Pe/NSaQ2b
	Nlv6CDAhoqkujumVqYlnoQhZGCNuqLkARJu3MWyojrGUyPDdBCvU+IPYMycjwizO
	DaI/qYbTX2FBltd89VfpiVNFcbgYTCeiE6+5qFLtggwc7eq9i8UWR5uvQiw1WUya
	inztiyyfhfoAIH8nHwfv4IUtU8EpjxYzsh9lYfnr2fc68A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e49vxatrw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 09:44:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b220c72bbso125274291cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 02:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778665443; x=1779270243; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l3LZDvSQIk1yYdY+57/8y83ukT6k6LZlb+xTzsHJqWY=;
        b=L3k/8uK0bSbZp6xdQu/h6EF3QYiAIxYK8tOwGIcWtwiYTePfYJ/JJm9Uldz5gRUfmw
         SCmwZWSCQjvKwwPqld4YaGwbiczYvTYqiAdlLCy2+FckHUUrsyGG46mX3yy8Esf/iOJY
         bo6HTkDHXVU24XF+fOSaCTaS7vUzyiyoNHTJBO2m5/KOHeYkLj/SyMTKuALYPc3P0ykw
         /IlmoX+yAXBQDpKzv+9kKg5DxaFyLJB3RMHJMHLmmfKAnN2X3zmWJxrujgJTFHkUEf5t
         aKfPqiwqPO4sxHacvGVR4Ng4N7b8RUnB57oVn+KQ3tS2mcY8ecl+4CYKFxn6Y5SVI5UG
         iXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778665443; x=1779270243;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l3LZDvSQIk1yYdY+57/8y83ukT6k6LZlb+xTzsHJqWY=;
        b=pol0E1foQtJqbqixlQVCcck9rb4MDGRDZwjwNZmMXjr0XRVLYp8Mgx+WSw2KIT3Qb6
         BKgLQ50WkMZsMyhsVKa8AXwIZVV0HDx4hdJFX+j2yjT2fZy8NtC3Q6pACj0GzahjtBN4
         hxryi+JyglBlVG+tWcqD4ogMETHjsqz9uGCBlml3YCj/VCm5aIpLM8PTkYxGBZw6E10s
         4KQi+ESfIWYZJCqy6ABob+mz7dgNyKiQBU4HFPi0c8TLQ8HTPI3Mm3wcCq11QCsOFsk2
         GV9DNo+rs0fypOfs94MIuVGDV/BZNmQKeP56emdr4cbkqn+PR8VYzrpIRHchikJam/rt
         NmUA==
X-Forwarded-Encrypted: i=1; AFNElJ/hUbT7pK6clqqHU3f+uvmb+eKWQpyW09/19Bo53SYY3PTcVAJgsKFMEgMsPlv0bJCuLmF8/K5Z8Kzucx6m@vger.kernel.org
X-Gm-Message-State: AOJu0Yydx43HjFTGcLB+Nkr36YOX0h7uiUnlY2LtPNH3nzMUXRGx07zj
	ciTGZ/srlHnP7R1wqswcAJKSfxHNv69dCiblSOWIfkBRJabxQtLwHJrNawXHuW4f4faUQBcJULH
	C5QqsIyEhMV33oPl4e+yn8oqByWatwuXgDoZhLEIL7RIZlKhjH/4Px+gtKYknkuogtBrS
X-Gm-Gg: Acq92OESIJP/hDqr8lgqvFwfoanhu7jDDJeCT+RHViUhkCcVu1B5LCSTOFNfKxrmVsf
	sdmsM7EjOPjLJexKyjcidl4UpgpdASNQnw3ZdAMNCibCZCHF2NueWoMOWo1zhANX7Rk1C5w1sEx
	NtDXBpHckB4DQFf0UA+PG+IflRdGidB1ArlOaWHyJKvXoRWzh3YQtZj1dr0Ye3NuKjvhl77EWa+
	IAyD0y9b5wlWBnM7AoZmin4DY0+8jZilNJ5EHVx5HGYB2XUXzp5rNSi6P1saGqIXd0NmMWpnNwx
	JFUxxTpVRjXQyGye1FI5fafcIbl68Hlm4QdtpBpwpu4F2VBgf4jr00cqcA+jHoSZDuQf7KHXZF2
	c2DJ1+B7HDVHQrFD+SdWvbGUYBD+ZpX+hjzrv42ylwAqe199IiFyLs9GtxpFKEgmUBuUjclMH3U
	K5DxMGpOBmdYpIWvjYr8edkYOypgQKyQayYWQ=
X-Received: by 2002:ac8:588e:0:b0:50d:6557:5c8f with SMTP id d75a77b69052e-5162f67335bmr32283441cf.58.1778665443169;
        Wed, 13 May 2026 02:44:03 -0700 (PDT)
X-Received: by 2002:ac8:588e:0:b0:50d:6557:5c8f with SMTP id d75a77b69052e-5162f67335bmr32283201cf.58.1778665442719;
        Wed, 13 May 2026 02:44:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951d487sm3902746e87.24.2026.05.13.02.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 02:44:01 -0700 (PDT)
Date: Wed, 13 May 2026 12:44:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: eliza-mtp: Enable USB and ADSP
 support
Message-ID: <66po5l2k76hrlnyyxx5hvzkz7wng2rwoskrrcuti3cbspmsgwm@ee6ijyw22dg3>
References: <20260512-eliza-adsp-usb-v3-0-6420282841c2@oss.qualcomm.com>
 <20260512-eliza-adsp-usb-v3-3-6420282841c2@oss.qualcomm.com>
 <bi7m474cmmnbdfxd3kzdt4hywm7teu3jo2bzywk4x2tx24lh6b@xhdfnm4e3rfs>
 <7a6tbenqnogpk3pbigds77ogo2zambykt7i7jshjhi36gam2oa@3hrp3icontya>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a6tbenqnogpk3pbigds77ogo2zambykt7i7jshjhi36gam2oa@3hrp3icontya>
X-Proofpoint-ORIG-GUID: gFZjA8lJrWZe3yE1FNsamXFpClo4zrpN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEwMCBTYWx0ZWRfX3eOiQaRO/ztD
 03wxM4FZm0cmAP0NJ2Cc03LTyxNI19lY/mgmHJJJGoT0FqNDA5DwwdcYTLo7LIrp6xalgnt8zXf
 thW3VtVjFIig8tdmYnsq9t0urkpiPYDpJoPdUjJcF4rGeqe6P886eyCWp6gv4NDdhyvlB+eN6Ae
 QRojqsEuowhKGHL54/ezt68kwFUVP1wJ9AwA17vTA6c6D9OEUMhOQkLW/xE7/C0usBMdkyWkmOA
 wOOBNYSvQB5x/OMYVu91QkmVFkCtqRtRZrUOskVyUASsCKU1VUm/NPy4eqqQOsZ/ga8OxYyrnkc
 uYdQnYj+fmCRE2Gv3MBpNumDHIijwrOm3rxDMVPvBnxGBMVyxGlJqN4x4vXQKwBebHszBDEB8Dq
 E0um3GNOMNEMg3S+IUZrENZq3HHS8PU8E5fOk6zdHW+yvGNP2xaMHl+giqicDVGdKnclJPivajx
 7Fcbjyozu4IULiHQ8/A==
X-Proofpoint-GUID: gFZjA8lJrWZe3yE1FNsamXFpClo4zrpN
X-Authority-Analysis: v=2.4 cv=A8Fc+aWG c=1 sm=1 tr=0 ts=6a0447e3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=uHCdCOU_0dtJ56D0yRwA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130100
X-Rspamd-Queue-Id: 5808C531025
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107247-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 09:10:13AM +0300, Abel Vesa wrote:
> On 26-05-13 01:04:12, Dmitry Baryshkov wrote:
> > On Tue, May 12, 2026 at 03:26:49PM +0300, Abel Vesa wrote:
> > > The Eliza MTP features a single USB Type-C port. Its USB 2.0 lines are
> > > routed through an eUSB2 repeater provided by the PM7750BA PMIC.
> > > 
> > > Describe the port and repeater, and enable the USB controller and PHYs.
> > > 
> > > Also specify the ADSP firmware and enable the remoteproc.
> > > 
> > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > > Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 81 ++++++++++++++++++++++++++++++++++
> > >  1 file changed, 81 insertions(+)
> > > 
> > > +
> > > +		connector@0 {
> > > +			compatible = "usb-c-connector";
> > > +			reg = <0>;
> > > +
> > > +			power-role = "dual";
> > > +			data-role = "dual";
> > > +
> > > +			ports {
> > > +				#address-cells = <1>;
> > > +				#size-cells = <0>;
> > > +
> > > +				port@0 {
> > > +					reg = <0>;
> > > +
> > > +					pmic_glink_hs_in: endpoint {
> > > +						remote-endpoint = <&usb_dwc3_hs>;
> > > +					};
> > > +				};
> > > +
> > > +				port@1 {
> > > +					reg = <1>;
> > > +
> > > +					pmic_glink_ss_in: endpoint {
> > > +						remote-endpoint = <&usb_dp_qmpphy_out>;
> > 
> > No redrivers?
> 
> It will come with the DP support.

Ideally this should have been a part of the commit message.

-- 
With best wishes
Dmitry

