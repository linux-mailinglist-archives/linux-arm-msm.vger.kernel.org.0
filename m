Return-Path: <linux-arm-msm+bounces-93901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLVdH7BFnWmoOAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 07:31:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FE01826EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 07:31:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B07663030480
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 06:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 367EF218E91;
	Tue, 24 Feb 2026 06:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O7znZ/P0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fRrDkPl2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5062D6E66
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 06:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771914666; cv=none; b=edO5xwV4DFan0h4VcCYBtgPZBo180glOkZvP07i2w4jezBSXPWrjW34TsQpSqt0F5wMjLGLNZhzyC+J2KKIdrbMduIjGX4pffYWrZDw7t0AIUGu0fPqChtJoRd1Zn/XvGCjMmmNm0Excimi5mH8CSSEeNtnsPOySNPDWwL3/EHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771914666; c=relaxed/simple;
	bh=WlaofgPeYYNCZ/PNpiXCPwGOJQ5+Gn0NjG59UAqJdBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dr8CRfZr8K/26ONi7NlJFOX04nqz8EpNnWgWaK31VUHmueiEu4yOYJDIcfyB5rIIQxJN1PkKbiQLBnwMCjRfklWLUhs8Pfq6LzC6vJlErSJ2nLpR1Cf9HD0jGmMPcorKRLdzwp+i5kyZaw6Y8elptuSjjYp2fGun3t82kAX7Lvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O7znZ/P0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fRrDkPl2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O4LdIl1807980
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 06:31:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mrnibdhDFWWXaZ2Mcr559Vtn
	d7wiGbsUwg3q2/yPUkA=; b=O7znZ/P0TTfUhxS2fNa6ZoVevQGqYLNeTCTGbJ9A
	KSbf2hef/0etqN6MJHIp5hLrJWxWQv8TezgiglnLCndmjfCeYsbSXKBl+S3iihrL
	+pUm0pV9r7+ryFw0xcYGOiufCVwxlTdd1pkv+bHWdtdf/7/AU5bDvgaFKj6DFA/E
	mB6n8aX5WSQJVQIHRK8bzd+R20T+s1XQvllbUX2BZEnywbbWJ7sFd/WfjZfRYZC3
	+udzw0at6JbdnhwQf4McSm7JkO0M6fgoilH3i6yGzF1RYO49d5GKjiRnA6n9qCaW
	EQHamhkSz9nAY2xiau/lUPTqrOBWbswCbmDHrt3zoSokuw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch4e38cet-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 06:31:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb0595def4so5984069485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 22:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771914662; x=1772519462; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mrnibdhDFWWXaZ2Mcr559Vtnd7wiGbsUwg3q2/yPUkA=;
        b=fRrDkPl2OMbxrBeao+H2nfwm25Fmv/44oRZ2S3LmJz1Tt4Ct4PVUOl9Jfo4Z4e58W4
         x0PQqOifRgUyvmfLsONq0LR5dPXYN3I7fFuGPTIptB1dPuYZpeoEV0qbhGx1/LeppCav
         D7T31M2X1+0HYyciOQk1P0XF3rQt/sdGsSdxTR5uFJawt1Gtnx2YOT0DlVd0Od/vqSbU
         JiwfezGCHXGKSwTXLFREqIPJxalFVl3HNt0uLg07M9qfuvcDHV5WqqLv2SXWPAmtd9xA
         OFEEmTMGGcoFlfyPkkNhPhrgzgzIC6Dglz9cDG/8p47zWDHRD3fYXZgPJ6WqEhgBhnDX
         nC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771914662; x=1772519462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mrnibdhDFWWXaZ2Mcr559Vtnd7wiGbsUwg3q2/yPUkA=;
        b=EbE+F+d7Gbz2DbgIm7Vds3tcm+HHMnynOiHndQx/6UJpReZue7zAwPvPDoMim6pA0V
         MMKIyhSkxoj63nics60fyaFS7s3Ae/fYvQ4nk6E/G1aPvY7mhNyjaA6LXvzE0t7LhfqK
         KqznsBPUuCcZG8FeYoEZK1ReEw2nD/7Xx80zTduk6HEakEFIENC57FHp3WgCodYqxLh3
         Qbzm+FjOl1DuMDrviOVj2kugQKFFpFw/g7vP/uVZFBRsx4JnIuHchxNwLFUedN+U8QNe
         NSMgRoZBfAbUqp5LqGNuHlAnHzf9G8PVx8iHfaXxNmOgk8Y1WdYdoPSXmCGpCp8Ms8GE
         gGAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbkBCUPzrvEWC97swhh50VB4RL8fYfgwbTKeheukHPyqmVaOs2HP7mQGKYmAk/VeCXkJvITOLJhPbkRW+B@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/zona1hQjprUHTzDwO/d+aRGNJEeftbaUY7AnKbsi+94tm0o5
	fqIr2nSaUQofHhrjGRLp/6tVOd+634A/D3V9JKRHKErLfZsmzlcFFcfbzfRMNovYFWHYKtAqvSC
	RXRHDa1JzQKWfeeVM0IsfiV0JkzeLyaWkGA17maJ5Xm9RnpiIVv2fu/rwy7M/Z6PbFaoTGHTDGJ
	sI
X-Gm-Gg: AZuq6aIEQEGcC4rpRK8Ffq05rsCnp13sKy2efh4Ej4FHr7RJkRucGJxkO7+mp1YOfrI
	vXS49Av9ww5DqTXgqZIBVjpc7F0K9/n0PsCPSSP71KfRr6a4kaar9Rl7s9yn284+41Uj5JTcjVh
	LquzsrLheJDGZj42w8veY0iTIWy7w8kzRbhFouXw6iDu7QLlG7sYYB6Iv28j1NHvjiZaH3/7VBe
	vSI52238AWHjZij2FFF9Ra9KHImP92f6Mh/GjVyHoiyGQfu/IkNQ5bFobGRR6bAisUJdkua53Kn
	y3yzG/oGGsokyNnZn2t2Na4MaXAH9tjtz5cRbRb2MnhraV2nyeMZpe+orSryYO5KtpH2+6QQH+J
	g0DipaK/RWZN/B//GdnqlYiHe/Fcy1NRGZUZfTKuF0yAt8KRDDQ8BhzAcPy3yxhxb3glwKjEKJv
	Q/LXo0m8UPZylKr3CzzvI+XPp4g9l3CU6d/4k=
X-Received: by 2002:a05:620a:1a13:b0:8c6:b05b:1f33 with SMTP id af79cd13be357-8cb7be3b53bmr2085231285a.9.1771914662463;
        Mon, 23 Feb 2026 22:31:02 -0800 (PST)
X-Received: by 2002:a05:620a:1a13:b0:8c6:b05b:1f33 with SMTP id af79cd13be357-8cb7be3b53bmr2085229485a.9.1771914661995;
        Mon, 23 Feb 2026 22:31:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb498cfsm1989020e87.78.2026.02.23.22.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 22:30:59 -0800 (PST)
Date: Tue, 24 Feb 2026 08:30:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, robh@kernel.org,
        srini@kernel.org, amahesh@qti.qualcomm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH V3 5/5] arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP
Message-ID: <lqt5k6w3peqlgvgeagp2v3yqtvqpaihsbkvu2hwfzel4j2whnh@qafj2mnrt2dq>
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
 <20260129001358.770053-6-sibi.sankar@oss.qualcomm.com>
 <e658b473-6f05-4f83-a730-e586068d8742@oss.qualcomm.com>
 <sgomjvhwnnbvuskxqfybczvxtwn2lourr5eq4mw4qyxp5s6kzc@ccgx4wn5wqi3>
 <24973bc9-a082-42ec-89f4-12758ddca136@oss.qualcomm.com>
 <yaunylao3nefmhbdovpfoymy63hjfjtvbwm5quqvdyk3enpno6@7rmpnx7esdhs>
 <8d96ebc8-67e2-424d-adbc-0948dd3641a0@oss.qualcomm.com>
 <CAO9ioeUSJQC685K47qMBn51r7APReO9T+h_K3bZ_94Uwn1unBg@mail.gmail.com>
 <48778fa8-b485-4c79-be1a-c70836f65f0b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48778fa8-b485-4c79-be1a-c70836f65f0b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=UtFu9uwB c=1 sm=1 tr=0 ts=699d45a7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=60J4MCMU89GRG9oapK0A:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: atep-ZeQ1resieGDDANPhcm0qKengBfi
X-Proofpoint-ORIG-GUID: atep-ZeQ1resieGDDANPhcm0qKengBfi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA1NCBTYWx0ZWRfX1yIazJ0gwgV2
 kAgQblbhFL7/Yzm5FoxQ+e3zx63Dtrf7iUQsG2nxgoLtVN6eqtXdkr5YO1NKNtLLF8tsHUbtR1V
 hpctabsPcPU8B8vXKtzwvfcf5WxPXXx6qSt1pcVxOeZtFLXwy2D9bV/Rn6+9JthmUixAhSJKEXI
 bNdEgB8menmDX80nNr2gREIWxIuDFqeFkkA2c3DQOly2zVAtOCB0NRSmSvcHWlvCjreqWzadEDU
 pPsAcw3M7a1CM1N0tLLLQeMsT04u9itlgAGzR6TxqiJe1vwT4hryr2kKAN3iflaATixcrSzO0Jz
 ZmYckWes2K+kde2wVetPx5EZ0rq+hPBP7kZGHF2fC5GbSv7kFmMsVpjnF2J1QYgjh3nfBJY1wU4
 drhS4CRn83FnxVXvB3sVYi5DOldJ6tTimjDVuVtjGDEogMp2WvtURpRHLl7ZWfG2Vt7Xe/tBue9
 Enkc7NFDZLKjS3bui/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240054
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93901-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 39FE01826EF
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 11:48:00AM +0530, Sibi Sankar wrote:
> 
> On 2/23/2026 10:44 PM, Dmitry Baryshkov wrote:
> > On Mon, 23 Feb 2026 at 11:09, Sibi Sankar <sibi.sankar@oss.qualcomm.com> wrote:
> > > 
> > > On 2/3/2026 6:09 PM, Dmitry Baryshkov wrote:
> > > > On Mon, Feb 02, 2026 at 11:16:19AM +0100, Konrad Dybcio wrote:
> > > > > On 1/31/26 8:54 AM, Dmitry Baryshkov wrote:
> > > > > > On Fri, Jan 30, 2026 at 10:55:24AM +0100, Konrad Dybcio wrote:
> > > > > > > On 1/29/26 1:13 AM, Sibi Sankar wrote:
> > > > > > > > Enable ADSP and CDSP on Glymur CRD board.
> > > > > > > > 
> > > > > > > > Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> > > > > > > > ---
> > > > > > > >    arch/arm64/boot/dts/qcom/glymur-crd.dts | 14 ++++++++++++++
> > > > > > > >    1 file changed, 14 insertions(+)
> > > > > > > > 
> > > > > > > > diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > > > > > > > index 0899214465ac..0eed4faa8b07 100644
> > > > > > > > --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > > > > > > > +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> > > > > > > > @@ -487,6 +487,20 @@ &pon_resin {
> > > > > > > >            status = "okay";
> > > > > > > >    };
> > > > > > > > 
> > > > > > > > +&remoteproc_adsp {
> > > > > > > > + firmware-name = "qcom/glymur/adsp.mbn",
> > > > > > > > +                 "qcom/glymur/adsp_dtb.mbn";
> > > > > > > > +
> > > > > > > > + status = "okay";
> > > > > > > > +};
> > > > > > > > +
> > > > > > > > +&remoteproc_cdsp {
> > > > > > > > + firmware-name = "qcom/glymur/cdsp.mbn",
> > > > > > > > +                 "qcom/glymur/cdsp_dtb.mbn";
> > > > > > > > +
> > > > > > > > + status = "okay";
> > > > > > > > +};
> > > > > > > Please make sure it gets to L-F (only Kaanapali is there right now)
> > > > > > > 
> > > > > > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > > > > Hmm, looking at x1e80100-crd which references qcom/x1e80100/adsp.mbn,
> > > > > > but the firmware in linux-firmware is (now) targeting IoT devices,
> > > > > > should we use WoA-like names for firmware on Glymur CRD instead
> > > > > > (qcadsp-something.mbn). It would match what was done for the SC8280XP
> > > > > > CRD.
> > > > > I think it's simply time to stop pretending the firmware is generic
> > > > > (some fw simply isn't and some fw may come from different/incompatible
> > > > > branchpoints) and include a board name in the path
> > > > Well... CDSP is usually generic, except for WP vs non-WP.
> > > Hey Dmitry/Konrad,
> > > 
> > > Thanks for taking time to review the series :)
> > > 
> > > The ADSP/CDSP firmware that got upstreamed to linux-firmware got their
> > > functionality tested on Glymur WP CRD devices.  Given that the firmware
> > > has already landed, can I continue to use the same name as the patch and
> > > have a different name for other boards if something specific has to be
> > > pushed
> > > for IOT?
> > Thank you for a prompt reaction, it took just 20 days. During that
> > time we could have fixed WP firmware filenames, but... linux-firmware
> 
> Hey Dmitry,
> 
> I'm really sorry that this happened this way :( but I was out
> on vacation the past three weeks getting married. A quick
> review comment on the firmware pull request for naming
> change request would also sufficed in the interim. Also to address
> some of your concerns there aren't any plans to push an iot
> specific ADSP/CDSP firmware for Glymur reference devices.

There are no plans to push or there are no plans to have it?

> Also, this series already warrants a re-post so I can still
> accommodate your naming requests with corresponding
> updates to linux-firmware.

Yes, but the linux-firmware has been released with these file names, so
you can't just change them. You will have to provide
backwards-compatibility links, which defeats the purpose.

> 
> -Sibi
> 
> > got released just two days ago, so we can't fix that anymore. Now we
> > don't have any other option than to use a non-standard name for IoT
> > firmware when it comes later.
> > 
> > > -Sibi
> > > 
> > 

-- 
With best wishes
Dmitry

