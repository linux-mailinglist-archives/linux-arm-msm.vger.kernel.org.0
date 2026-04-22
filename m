Return-Path: <linux-arm-msm+bounces-104060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AM5yCuGX6GnVNAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:41:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C6F44423C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 11:41:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C2066301E035
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 09:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BD3F3B8BD7;
	Wed, 22 Apr 2026 09:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JVS8D586";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VGHM9zTT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1EB345CAF
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776850909; cv=none; b=RG7jmrKO2h+JLEVaXdlr/zklNZl6fO2BjBRLg5dG+R7zK5ykGbhD6rLnNeFh+nA8q5hVYs0jCRMJ4dXAG6s3m69g01vEqbtJSPkZmoQowKGnhmTyuB9YtChizKna5hatfp1rQ8FcAVTdoL2o/3MD48t626CTyaMvm1FFhAdTLvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776850909; c=relaxed/simple;
	bh=LOI6/LVQn8SD9yPaKiod2ks4gcbjklJzv3ForOpCgp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V7m7xhsUv3NAhNdSIBDkfomo1bKtBVsU/uhjyRp52JxtFe/9k0g0b9v4EaL12mtXkK+XIVISDMtrUPgTMfPPVjXz4dh2cwKyE+mYGtr3fmyeA+1iworY64V5i+P65J9f5JYPS6GQ8S/RdqZEe/hHiMcQ0GYmriKcYxzb1q/TLjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JVS8D586; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VGHM9zTT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M96E9n664048
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ivQ/kw5qwXuL7FDvBnq+krMg
	WzBUjO0CAiF6a0jDMEw=; b=JVS8D586Q017LvlnWLsj7Rxje7YwF+SN13N8JdHX
	nXCEw+NwXRgjaRWExieAgefiKGdycbJGEfeQay5toCel/NXuQt0kBEsitjWGC6JS
	mqv36WlPuXB2HkRr44wSE0sxBytZsAj0QWmctvkgOuhAeZxEy/oC3WJq9n4AwZpF
	q4JKWKsBxY/2gSKz71FSZaQ0159t0YcF8180+r1vXeRB7AFYV96bXNyknEf7lQnK
	iSKQAP5cJc7VuIn4oeVerwTCWaF6NWhmzAya1WqWrojIAmo7M+5D1X4oYnPE2Z/W
	Eo+wuGuQE6kxIsa7so7WBYyyNPbdstHpNAeMrMcFPZ9bFA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpudgr5da-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:41:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d812c898cso144878391cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 02:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776850906; x=1777455706; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ivQ/kw5qwXuL7FDvBnq+krMgWzBUjO0CAiF6a0jDMEw=;
        b=VGHM9zTTb9xA2DZVIArf8JpNqFk8K4Se/pG2KuJBolXx72aDtSAS4GJiiGNoO6TXBB
         JGftE2MyOtbWuXbvtfJieMTRsqUJPsLn+pRV3iVxocEp2uW0sjPv+No76i9FFHgyfNRa
         BOyIGWEvs+SGEgpNcYKK+oBQlWaJkpL9UmvPiejLwpynEBAOSM5sj+RzK6FQsupytxSj
         G0cxtE/za5gBEGruRhw7PkMLeMOjBZslFrH8NT/JZMN/Wr/9+YECL0XQRbOs3Y33WigM
         ZAqxbbNLSxvYVFdDEYlhVu7nMUtdR88wSTtr5V2G8vQbBSaXRVEeQWb8DieG0FQT5sc0
         WhZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776850906; x=1777455706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ivQ/kw5qwXuL7FDvBnq+krMgWzBUjO0CAiF6a0jDMEw=;
        b=hIhPzgH8T06EeOtFoIdgh+FDbUs7tbjYenQcWI+U0Uf3dS16ujQfLoKhBDKosXyihE
         zKK0rXssKCZU/9WbXFiFSU2iUM2GHXX2BKGjT4QZ3eyrt/E8LUgAB1o6I5VV9Ce6M6cQ
         NqjsuYHAEc9bHDY/STp0b0svppFST8gXczqEZZTFb3Cawi+DKeymUQq7t/mAN5GPkBIP
         FMT8lLmjNsrZXXTzd2hE+Vt5BjRKzTHgXa0lz+gjctiCSpUvkYgLmiYQoRjZ7BDV27Ze
         LEIyJ4/73TD918ZCfFPdHB2lGPQqVc+s8zQ0qTIUfxpmuhhCVfstpli5MvLIl3uOGNu0
         hLpg==
X-Forwarded-Encrypted: i=1; AFNElJ8np0qwTSdTluoqtZuU/lBoWdEpsMoCNTl0ehHoAbk62b5YRA2sr2qsQ3bn3lFP2WTHWKLdr9xq0mzbtBnA@vger.kernel.org
X-Gm-Message-State: AOJu0YzbP5HKVvIBAzR7zIlMFMsl6XkVVW2WUs1zypT9GtfXIsv8gKWl
	rqJbXr6UexB3v4aH+Bu04nYOYIIlij1o3daKcZk7/0LbadEiWuAcjh/+mn3MXnbyPA5g5U/RC7X
	yuiS5oVL1kGyXNENyYkfWs3zH5/JAPyYF97NGTBc+aBexXK37E17y1+W7bDLAZFn/kKsidkfGc6
	ox
X-Gm-Gg: AeBDieu48Ejg/GnjG1aJ78rOSs/nJGeoXZ1WK5Z9gYrg3vXnhtov/Ly7fcCtYBI2Tki
	6DIQDdeySUaNJG8NpASNX7Gk9u1Dcz2lyhzUTjlE/DgcnIznU5QUxGFrLswAtcXT0YX7Eo9xINl
	lSG3MkMqhHoxgubhUg81wIUEaBWecTHANmkc4GiJ6ad0ZbIsXfeXSF5potTXHMURdttRHWFWGz7
	lER5dd39Fc5fe1PGqxPsGkCozv94hQ5wAddwUPbZCy9Q0lgLlGHrkzqmjgSWcfr/j0NccOLwB+9
	17Ag/gqQGnAbU2gueITETZoFuOl8bQUDAbmxHCsJsnYDi/L3AOLyJYx90QlWRgm5NizWr3Zizs/
	orqI7CvgpKY9o51WkUgUD2TMhT09GIrKdmHMfJWDg5z1UCVU=
X-Received: by 2002:ac8:7f4e:0:b0:50f:9c32:509d with SMTP id d75a77b69052e-50f9c3258b7mr141347441cf.60.1776850906375;
        Wed, 22 Apr 2026 02:41:46 -0700 (PDT)
X-Received: by 2002:ac8:7f4e:0:b0:50f:9c32:509d with SMTP id d75a77b69052e-50f9c3258b7mr141347241cf.60.1776850905907;
        Wed, 22 Apr 2026 02:41:45 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a5499b0edsm126575955e9.14.2026.04.22.02.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 02:41:44 -0700 (PDT)
Date: Wed, 22 Apr 2026 12:41:43 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: eliza: Describe the ADSP and USB
 related nodes
Message-ID: <p6duntiwahnmxwit2qgegcmqerv3or3h36y5cel36ekw4vkcfp@exmgriqkkqqb>
References: <20260331-eliza-adsp-usb-v1-0-d8a251be20c3@oss.qualcomm.com>
 <20260331-eliza-adsp-usb-v1-1-d8a251be20c3@oss.qualcomm.com>
 <69d644bd-d64e-4ef4-b0ca-b47103e84764@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69d644bd-d64e-4ef4-b0ca-b47103e84764@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: VmjH1kq4TLlMSI_5AIrfrIWCJflUx7lO
X-Authority-Analysis: v=2.4 cv=c5ibhx9l c=1 sm=1 tr=0 ts=69e897db cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=CyeY8Pqlq_m8jXTRazsA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: VmjH1kq4TLlMSI_5AIrfrIWCJflUx7lO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA5MiBTYWx0ZWRfXw2D74BGJSRNk
 ijeSW9TDZjYdjqggzTYPssRVKVVmFApB9G0LkBzbm0GJT2C42EyOpRH83MbKVOnb+LGYcErqomb
 NTFwd/k6fXlWsz+pLm6NWBgQ0PkVy4S9sNb+jDycimx5N5Z72FLw7/MMo9d3Pl+N0JG1kVFflSK
 Smd7x5IYNBhVgikydBt04jAN9diL9lHymIh3Kl2NcQQf1MMxnzwjvkVSyRdUQCdasSK2MtAQ95K
 c7HiuGCjuO8L4rry8hDbA1ZrQCKgS+RZPJUpsMOi0paryx1FqR29m/pjpLPr5wmaWadz2u15+zf
 ok9FGePEb6rT/ak1/sHig1sVN29Q6e0+Cp6pvQomLNnXtlWIBnAMMyFWHKjeQgK9FcQRgaGXSuD
 pDKr/mPtK5k/YWmHv60vZqla0dzCpU3Mzdy91j06v4G9uk7DA1OrrdIo863nsJr1BbhJFFogvq6
 IPeG4Zaza6JVjAl7fJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220092
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104060-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B2C6F44423C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-31 15:37:08, Konrad Dybcio wrote:
> On 3/31/26 12:37 PM, Abel Vesa wrote:
> > Describe the ADSP remoteproc node along with its dependencies, including
> > the IPCC mailbox, AOSS QMP and SMP2P links used for communication.
> > 
> > The Eliza SoC features a USB 3.1 Gen 2 controller connected to a QMP
> > combo PHY and an SNPS eUSB2 PHY. Describe them.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +		usb_hsphy: phy@88e3000 {
> > +			compatible = "qcom,eliza-snps-eusb2-phy",
> > +				     "qcom,sm8550-snps-eusb2-phy";
> > +			reg = <0x0 0x088e3000 0x0 0x154>;
> > +			#phy-cells = <0>;
> > +
> > +			clocks = <&rpmhcc RPMH_CXO_CLK>;
> 
> This is TCSR_USB2_CLKREF_EN

Good point. Will fix.

> 
> 
> > +		usb: usb@a600000 {
> > +			compatible = "qcom,eliza-dwc3", "qcom,snps-dwc3";
> 
> Does the device suspend and resume successfully?

Well, tested with pm_test devices and it does suspend and resume
successfully, but there is this:

[   54.584126] dwc3-qcom a600000.usb: port-1 HS-PHY not in L2

But if I'm not mistaken, this is valid accross all SNPS eUSB2 PHYs, on
all platforms that have them.

Please correct me if I'm wrong.

Sorry for the late reply.


