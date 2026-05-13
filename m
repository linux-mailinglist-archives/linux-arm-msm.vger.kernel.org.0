Return-Path: <linux-arm-msm+bounces-107249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8B62OkJNBGrhGwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 12:06:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A6B5311DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 12:06:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CA543018ADB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 10:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BED5138D6A2;
	Wed, 13 May 2026 10:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RMVLVd3Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KPfel4Uw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AC6389E18
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 10:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778666661; cv=none; b=hmAKducxLphprV/AGLJSbRzc12fLQ57ctalbf3oSgtiHzoDqLicRs8KPsheoGxwQLDFUysBmAZcw9lzqxDiN6zKUkNoewO1bgmxpVblLwt0zJz1/1xSxwQpt8nepE9c10LARzbMlG5F2W/UmQCSOCKGMRTNLDP67e3d7dN5+2vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778666661; c=relaxed/simple;
	bh=988JccY5DXVph08N84rMxWo+DWYg41evQk4Fv+SQsME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gEb1t061LUlP8Jlj7lzF1kT1HPOUqTjrSzq3V0amUitdESYRnN7ci/XuZqSMHmBcPCYNqtVvl9Ojy2Z3c39DWmp0mD0OopCAF1GFLqDMn1dKaNJIEI/Xy0rsDIpJjKhjj1LkcSOAYhypQ3F2qbfk8ioqvXWM9kRgUVvsqiVz9So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RMVLVd3Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KPfel4Uw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8nJWE2888326
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 10:04:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lOyW6IxsQaLaEmJcJuUH5HBn
	GHV0T27RV5rr9kaXbWA=; b=RMVLVd3Y1wRZTpgNelStmtNwyKLsPO4DMiVa8/N1
	pq3QVJwxH++fFInwpoWmWdkj75520yimqGbRE6MNzzN2HoObMoqmqcMl1afzWSgQ
	nduvPQ74fs2Pn1xWWvO6B8q2d57+cNdgCBuaZi3EJ6yIaaPTjrzD9XeCW6XJgh/Z
	beH+DWrJjttEVYft6gCJZ921J4PWj9iaXRMvNbU+J4MyIZaaO3jE3tse6Y+D3JcU
	ipIHwiLHvtfD+y4O+W7DaR/BMiVr+zz7iArmaHZfrkXCSrMkqgZ54wS4Piuh259I
	bQv9lB8wTmX9LkkS67U5F4kpRJuMvSetNzjo3nH3zG1u5A==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p4gg9qp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 10:04:19 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95cf2f6a8d6so11048873241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 03:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778666658; x=1779271458; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lOyW6IxsQaLaEmJcJuUH5HBnGHV0T27RV5rr9kaXbWA=;
        b=KPfel4UwwR2bPIoPjtE9ET7DMXsSeIR5TbxxUA6Xuls8e/jf4kPSBHnpSuClzaGvT5
         U4ydXhaJ/E46RK9V6djwumZ1TFKJ9GYAXyFO3XVMb958rE0LX2FP6UnOjGLtJfOKjcDx
         N/MRRtOkYKMTT12NJsquTmXnxUKFvJWQDuIwApUfOdSVEX+xhbasjl7rLM8HLne0D4Vt
         A3XHQdDJfCVhEFGOsy1XSnszQUtwSbrXTpVv1q2sDn8ZxyfUKW5yYW7IaG5R9NkQXvbL
         hSvOLwcWfhkrj3SkzSqLbUjySTP+Dzv2rsU65ECKKkgoP+MFLNgXWQiLib6CCURclwF7
         Jm2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778666658; x=1779271458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lOyW6IxsQaLaEmJcJuUH5HBnGHV0T27RV5rr9kaXbWA=;
        b=ed60GUd5amygdDImCYJcLoj1jaw3buE9NK1997iiZ8yvMSwYbAqWOJlJXVXFq6W40d
         jc4iWIi5KFiyyzHwlHFoqDILmYqOM2l35gtbDNZWoTderoNUdTjYz3C03o22zBBXVsI5
         uRBLbzRW4hsDBxN2xHSBbRXiiGVEo6ewJPky2Oz3P3coIL5dbSBFyhCbWeoWpWAyPo7/
         xRm2JwTKEFjeHKlGcwA02aSx80N6pRmRb08fUYw0fmzXBws0ppu445v5fgxtR+zMDZ2r
         UIzwPFVybbmsba4MDzEScf7TsyH2smf4JuYP3ZB9xwhtCLuVCZ/ZjRy7eEdQhEnIQM/r
         XBMQ==
X-Forwarded-Encrypted: i=1; AFNElJ/+V7p1/A6y0fe5Xw+PfTLCplU6uajh7hG7l/bHDEpWGRWG41RO87I2RGvWm9ckEG02qgdGvdBUyC2Z416j@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8YEhiMC25IoqgRlpyT8DuwrOdpaFVS5vDB3XYibL3dNb4mnM5
	JAyfVraoFz9JIse20mlyjbO6YEaV+juphHUxJnAjV4VIc2vC77DjIF6dnyFNBoZ4mC9m8DOy8wL
	cx5ycf++oFsvjAyty1imDwhICdcDIOHYJdIVgRQg9lzJ7iRNk+5mBqxJcAfeK9os9D4FS
X-Gm-Gg: Acq92OFETCGWV16ls2jI/hsQpkj1ZmnPg2rcAtWAT3rawPBoV2TRJS9eoElLCGrLuk5
	sK1UrOwieq9X1pWiL/6c9h1hBtqyXXeP08PA8MYNoe82/UyYPOA2V5+6Ws8ErF/naowQ6i2BaUG
	AI/eqnrZdJ9NIP75quFL3d7eylY+eUaGQgq4LTXaOL/U6fmAx0Sk30KVAt8jZP9Gt5NqKQKC5eQ
	FKMwCjV+BJELnf4SWsXnjZ5fYQf3F+6Xl9lFS3QHL8ZZBpgBOsRMcJeh4rIZ1oxh2efYDHLRsOp
	533V3dKHHWUwovYdMrDTMdQ6Uy7+Ia5zL60K8adHlfVGaaMDCP6W07GlZJsrw9glbjxrfJtsVC5
	T+MB543qbGfA9MbLPqHazRSxdCqEbtNm+3PbnfQ+l89m5fjFLSA4tyRj+BuhaXjpeK3iOQ+BG3Q
	q+OpHxCE9KCFheb+1ufkqiNmFiAA5cUxTPHRw=
X-Received: by 2002:a05:6102:c54:b0:628:95d9:9607 with SMTP id ada2fe7eead31-635ced58b00mr3291552137.2.1778666658486;
        Wed, 13 May 2026 03:04:18 -0700 (PDT)
X-Received: by 2002:a05:6102:c54:b0:628:95d9:9607 with SMTP id ada2fe7eead31-635ced58b00mr3291544137.2.1778666658114;
        Wed, 13 May 2026 03:04:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951d32dsm3903903e87.30.2026.05.13.03.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:04:16 -0700 (PDT)
Date: Wed, 13 May 2026 13:04:14 +0300
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
Message-ID: <ot3otriuc7ntjsuqbcxwgj4wj5tzcmirkgao3rbrz2flmjmbvf@vsyqdwpfnnxo>
References: <20260512-eliza-adsp-usb-v3-0-6420282841c2@oss.qualcomm.com>
 <20260512-eliza-adsp-usb-v3-3-6420282841c2@oss.qualcomm.com>
 <bi7m474cmmnbdfxd3kzdt4hywm7teu3jo2bzywk4x2tx24lh6b@xhdfnm4e3rfs>
 <7a6tbenqnogpk3pbigds77ogo2zambykt7i7jshjhi36gam2oa@3hrp3icontya>
 <66po5l2k76hrlnyyxx5hvzkz7wng2rwoskrrcuti3cbspmsgwm@ee6ijyw22dg3>
 <inf6cqpumbmo5eq4jejsfhbsqgpimi3mjzxwxk4bn6cvlwgjfn@d5judcn2clxe>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <inf6cqpumbmo5eq4jejsfhbsqgpimi3mjzxwxk4bn6cvlwgjfn@d5judcn2clxe>
X-Proofpoint-GUID: KheZ1F44qlpf6A4Zf_dnjmm7FixvPuXM
X-Authority-Analysis: v=2.4 cv=DOS/JSNb c=1 sm=1 tr=0 ts=6a044ca3 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=WgiHbWNedv94GWvrKy8A:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: KheZ1F44qlpf6A4Zf_dnjmm7FixvPuXM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEwMyBTYWx0ZWRfX63YvnmcDcP0H
 3NdNKWRAvPSYSh69/xhjXB2VTGL+e19HK80Nql4t6oIYvpqZdLsY3r3dYf0UAQOEirUf/nyOnml
 dEIZq3vE7RoQJlhZJlYErShwunyHKNajMdcthgpN3V/XBQngAKr94KkDzEhQa3f+LQG/djBvOwg
 RpNTYy5vokwN7khraXQ46L7wB53Mh9g0WU8Dja5f1m8pP7Q9588MdWcW7j/OaXg+yxKZtfQfjzS
 NeZL2tC9keVi2ECDc2/tHjTx9ZRjCk7ZvmMwjjITAqWhGtzmu/lQvKfOR5yFlyTUkg/L8FIMMX4
 2lkqcr/qjQv7CMAs9UCCHaxhZibfMFqOG4LMCBYNOkWZVfzmpjq6B5fqTjvGpGB4qnXa2lr/6p8
 wsMY4rTMto2PjnM/3rG1NxYmC4/CZIWovovEIohcrvPEt00w83jZggNyYR+TkEhG9eDLOQPLk/1
 czHPrIdhLnG6tWH4y2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130103
X-Rspamd-Queue-Id: 44A6B5311DD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107249-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,0.0.0.1:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 12:58:05PM +0300, Abel Vesa wrote:
> On 26-05-13 12:44:00, Dmitry Baryshkov wrote:
> > On Wed, May 13, 2026 at 09:10:13AM +0300, Abel Vesa wrote:
> > > On 26-05-13 01:04:12, Dmitry Baryshkov wrote:
> > > > On Tue, May 12, 2026 at 03:26:49PM +0300, Abel Vesa wrote:
> > > > > The Eliza MTP features a single USB Type-C port. Its USB 2.0 lines are
> > > > > routed through an eUSB2 repeater provided by the PM7750BA PMIC.
> > > > > 
> > > > > Describe the port and repeater, and enable the USB controller and PHYs.
> > > > > 
> > > > > Also specify the ADSP firmware and enable the remoteproc.
> > > > > 
> > > > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > > > > Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > > > > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 81 ++++++++++++++++++++++++++++++++++
> > > > >  1 file changed, 81 insertions(+)
> > > > > 
> > > > > +
> > > > > +		connector@0 {
> > > > > +			compatible = "usb-c-connector";
> > > > > +			reg = <0>;
> > > > > +
> > > > > +			power-role = "dual";
> > > > > +			data-role = "dual";
> > > > > +
> > > > > +			ports {
> > > > > +				#address-cells = <1>;
> > > > > +				#size-cells = <0>;
> > > > > +
> > > > > +				port@0 {
> > > > > +					reg = <0>;
> > > > > +
> > > > > +					pmic_glink_hs_in: endpoint {
> > > > > +						remote-endpoint = <&usb_dwc3_hs>;
> > > > > +					};
> > > > > +				};
> > > > > +
> > > > > +				port@1 {
> > > > > +					reg = <1>;
> > > > > +
> > > > > +					pmic_glink_ss_in: endpoint {
> > > > > +						remote-endpoint = <&usb_dp_qmpphy_out>;
> > > > 
> > > > No redrivers?
> > > 
> > > It will come with the DP support.
> > 
> > Ideally this should have been a part of the commit message.
> 
> Why mention something that is part of a different support ?

Repeaters are a part of the USB chain as they also affect USB signals.

> In fact, there is no repeater, there is only an SBU MUX.
> 
> Which will only be brought in along with DP audio, IIUC.

Great, then there is no need to mention anything.


-- 
With best wishes
Dmitry

