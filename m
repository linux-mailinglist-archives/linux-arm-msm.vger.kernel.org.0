Return-Path: <linux-arm-msm+bounces-117022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DUE2IpgDTGoGewEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 21:35:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2AE715087
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 21:35:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DtDnMNsB;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XvoITfgN;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117022-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117022-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1881C3025AC3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 19:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38E8932695F;
	Mon,  6 Jul 2026 19:34:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7133D3126D9
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 19:34:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783366480; cv=none; b=DE4Pf/c6ID14MH9+tq5VW+cYVB0wBgRe8OH/NyZ3GkNoVLkxAu54xui3B+CoybkxLHIQ+3x3embZh0rDh6hzfWYy8UiGAR0eVGYdF7pWwxRXXUCfeWzufZoautkizFzn+AXv2IfXReu/n0y9rZPSNQidfNOeY7AgVcJVBozNl/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783366480; c=relaxed/simple;
	bh=G5bzsqL7CD6Jj6kiG9Oe7kbdaoiW/kRUDknhNrluwK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KjEgobEUc+2Z+F8tlbSQ7S0wXk5Yhq742DK9vKs9K3cvfOe8+rSfuKpInAX/4T2Y8/mKVWT0vTF/nJNqOQmJTwlVIIBnLSr5lLvhUu/fmOs5eicFr3TYlj2z2Ki2BHBwb0rMTqIdNuhAgnnHOTlWNM7MO/4jv9feDpgyMV13YHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DtDnMNsB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XvoITfgN; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFLph947752
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 19:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6DHjZemGZbGTGMEMZvfJ4XTU
	0d57xnMw3yNqcpZYiWM=; b=DtDnMNsBzHzC0TD4SHYPpX48Eo/CijmqywYKbORt
	vnFqEQUjKUySGwVuaSb5s/rwLCbjhpvJ5mkLUG8yaHWJ+8rMX6JhQvmji6K33H7G
	rNe5eDeQL5l6fsGjTLT/4htEzkKJj79G8cQHMKDD0XtuTrJLaOXcrwXNVD+r7Uvk
	FSqeeeqO86TZIxTnOxFHaKRXIBABkkhQkI9imCDPkIerqLKJCwgvny/HCoLX/owG
	3uySDKT+8nvXyKA44v/2FeUXwvvjDyHb7V06WmewVVRq64CN7T2IsdOsDTZFfACW
	ZNeJrRT9BCkqRAuLx1bI1xmdFRN2BQaVjGI9/JvYHw9VRw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h530n7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 19:34:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e55721a8cso360988085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 12:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783366477; x=1783971277; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6DHjZemGZbGTGMEMZvfJ4XTU0d57xnMw3yNqcpZYiWM=;
        b=XvoITfgNBDYYrbRyB4XXXMficpoMSqgqSJ0FYVZTxtvC8ZMTSjH9n2uiTqJws/F8kl
         /ppgtVzFhTeOm4yM4UzchyqacCbCSzG4Gg8q+Obut30KoVhNtAVb5BfnUdqUuNnfmivO
         r4TwNkhFL96EO9DtweC1uNLNddde8EgUyvM+RaRBoo/ntyuF3mx1+gG6Q63FgAyZhejy
         FxcHfHbTt4MyAAHyM3EHagmlY6B2jGv1leTy50+y/gDzzBI9BKpGEbUN4ob0/JgYCKAX
         4t18kmClfJKER2iS0dRfTths1Lf8eIqtfiesdaW1awvuvwamnbGeIX0jc0AcEkfqbNH6
         SzEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783366477; x=1783971277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6DHjZemGZbGTGMEMZvfJ4XTU0d57xnMw3yNqcpZYiWM=;
        b=qgJ+u5XwAGP+hhydjI1r3ZfQjcNTlBHpu5bdNWXq1vSrDRtWtALIS1q9tpYv7T4RPO
         mt8wKoKOo8fCW3lcmToc/8eE0gd4kDU8lkzA8L8qrRMOt9tbwdzV6eT9l6ZnOGHF3pFk
         fr5Raoo9enxXNTtD+OdLcx1LtitGsL48lqyCSsTHfBPDmkvkH72LqeiItmxK9gTdYevv
         /S1SYjH23eyWyzlSn7WkkxPyJK3Y5aI8gBG1imA0E8Ky0JmVV2H7a8BdB7GoLggbSNbA
         QZIhISKsuUai0HyUetM31jqYgAWU9IVEEWGO5rlgyKnGH3cFSYybWpoHl54gEO4SDcwZ
         0Z+w==
X-Forwarded-Encrypted: i=1; AHgh+Rp89CytVD0k68xLkREnuTM663t4AbV1swx85z+EOfeVNJax9ZNWq95zSdnAtEFw2moCYzp/Vsana7pXKt9V@vger.kernel.org
X-Gm-Message-State: AOJu0YyXX+QXVnqamT/l506EBe9AI1GnKpWmw5Bce0eQPpseuqZPVplo
	9a04uGRQLOAcDW+5haSEhf3OEBFi0kRsa9xmqyztICPY7BVi7m4Br/6icLySkCfNC1PY+rCeyIp
	IrTsZLvXrvlHNZr4FYMLQdcCGZKirYfw3BKHS2Xl+MRuSnIHraPhMc5Z3DqXTSOSwccmK
X-Gm-Gg: AfdE7cl4QXZgS16l6qaJ2+Xz1BznEpkDdW30YIGWLIfP9bkGR6gO46ZJdM2QK2H3gUT
	FZUYYU7NyBLDerMNDvSqsS36ncq6JHxs4eAwb1J+qirTCDaa8ETav6WxLh1WcbAUge0qHpBYSHP
	yEkLwVqqtLzUEXc4Z1AKNY5jXBG60T1QHNI/b2PiYJv11rSY+RDGLEeZ3B6MBBwLHjI3gaKrYLz
	R5PHvB/gYTMFaAhZg4iyHFXy7NVsReU+M4e1vOgYWbDJUX9xqjYbb2jQLCgYAspaaTu/YnCCnoN
	fHhaxATRxQeQOD6sDCwXSSd40DGtsauHI7dzyOhMTQGbnkhD1R3UOgLcY+/Cz/3RH7UQXK/ivp9
	3PAZ3yLewlnmxvmcrVPFebQJuQda81B1r1A8L35zu5il4wm+p7cxJ2JlchFba3bvhNIV6wL2RNC
	GleYjjwY4Hu0KK6bbmi+12wi2G
X-Received: by 2002:a05:620a:6011:b0:92e:59b0:df08 with SMTP id af79cd13be357-92ebb4c1058mr311311285a.3.1783366476706;
        Mon, 06 Jul 2026 12:34:36 -0700 (PDT)
X-Received: by 2002:a05:620a:6011:b0:92e:59b0:df08 with SMTP id af79cd13be357-92ebb4c1058mr311304285a.3.1783366475990;
        Mon, 06 Jul 2026 12:34:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c63ce4e57sm1325031fa.31.2026.07.06.12.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:34:33 -0700 (PDT)
Date: Mon, 6 Jul 2026 22:34:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: Re: [PATCH v4 01/10] dt-bindings: firmware: qcom: tmd: add TMD
 device type constants
Message-ID: <e7eho7ezujbrdzgumshapf2r7hu2jaujib7lvotrqvcj5er5ut@xpd6l2kgipqu>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
 <20260703-qmi-tmd-v4-1-3882189c1f83@oss.qualcomm.com>
 <977711ef-c1fb-4735-b82a-4ca2f4797f51@oss.qualcomm.com>
 <8ad14017-bce7-485e-9677-9cbf8ecb2742@oss.qualcomm.com>
 <yvggh2zs6qkuyuzvwydkecswnjoyba2d7t27br6xpk6d2csp53@i25g6okdktz5>
 <10a346d8-fbb1-4142-a650-507c3917b8f6@oss.qualcomm.com>
 <dv4n4ntnfvhouv23asgshgs7wcolkmqs7lbuni52maexo4s44x@4bqhf33x4fr6>
 <1aca8d60-8e39-4532-9095-a5260bba76ac@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1aca8d60-8e39-4532-9095-a5260bba76ac@oss.qualcomm.com>
X-Proofpoint-GUID: IEjHRGK7-LT9vNFDyrqVcSqQo0eqCLOM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE5NyBTYWx0ZWRfX9O7ow07vCWK5
 Sr7xwCJexptj6PzLZ7SblrMci3XfOzs8SmTv2LxrKzqdPyHqxnHVzIh3Zpn/HZbNhIiYm70xyrv
 nUk4Xfu+bEwC+Qlsq2qO6P0qJTgaMUo=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4c034d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=AjCqL75dquvNJiF6hoMA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE5NyBTYWx0ZWRfX0RtADmfJc0O3
 mH9yOC1tmNXueXPN28bBwgr4RILc8OA9vboqR47dZPELBcLaMDtfjmj7XERIL+Fdvfn/oMqtiUp
 3P1IxQvvAAqfaAgkbMarH3yMwrfOVYd7awfcq7ok0qmFVo8y2288/nAge9TrOzpn8ufeqMhlhwS
 byvafgFZ+lTDKoKHNatIrPFHWBdwlt5Wxeg/Cw7oGKq4/DDnpE1MAjM64OIvViGulp+IP9hb7/M
 bcRq66r+pCVYS0HUEs/fbUMJshxkzk4lICRBPcU3B0eh1nLG/YYJY82fwd0XAK2tYAis3dh5Hck
 aAfJG+vVi0nBenUkb6UlrEVmIVvIwwvQEf43jndXVTyByAO0816cAFrHQTG7XbEFo9uJvq0igrG
 t+CGhpMWDE0/FKmFJbiTAVYXYT7FoGdpdbdfcrNYIytOOyVbjVRqg9I1N6bAK7awi3sZAIFLn0k
 3URfoQAEGJXn2Jla/cA==
X-Proofpoint-ORIG-GUID: IEjHRGK7-LT9vNFDyrqVcSqQo0eqCLOM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060197
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117022-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:daniel.lezcano@oss.qualcomm.com,m:gaurav.kohli@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,xpd6l2kgipqu:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C2AE715087

On Mon, Jul 06, 2026 at 08:11:35PM +0200, Daniel Lezcano wrote:
> On 7/6/26 19:47, Dmitry Baryshkov wrote:
> > On Mon, Jul 06, 2026 at 07:03:18PM +0200, Daniel Lezcano wrote:
> > > On 7/3/26 17:42, Dmitry Baryshkov wrote:
> > > > On Fri, Jul 03, 2026 at 07:43:39PM +0530, Gaurav Kohli wrote:
> > > > > 
> > > > > 
> > > > > On 7/3/2026 1:23 PM, Konrad Dybcio wrote:
> > > > > > On 7/3/26 7:03 AM, Gaurav Kohli wrote:
> > > > > > > Add Device Tree binding constants for Qualcomm Thermal Mitigation
> > > > > > > Device (TMD) types used by remoteproc-backed thermal cooling devices.
> > > > > > > 
> > > > > > > Qualcomm remote processors expose thermal mitigation endpoints
> > > > > > > through QMI. These endpoints can be registered with the thermal
> > > > > > > framework via the `#cooling-cells` property on the remoteproc node.
> > > > > > > 
> > > > > > > The QMI TMD protocol identifies devices using string names (for example,
> > > > > > > "pa", "modem", and "cdsp_sw"), while the DT cooling-device binding with
> > > > > > > `#cooling-cells = <3>` requires numeric device id in the form:
> > > > > > > 
> > > > > > >      <&phandle device_id min_state max_state>
> > > > > > > 
> > > > > > > Define common TMD device index constants shared across currently
> > > > > > > supported platforms. If a future target requires a different mapping,
> > > > > > > additional target-specific constants can be introduced while preserving
> > > > > > > existing DT ABI.
> > > > > > > 
> > > > > > > Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> 
> [ ... ]
> 
> > > > Why are you using only those TMD devices?
> > > > 
> > > > > More constants can be added as needed.
> > > > 
> > > > Kodiak is one of the supported platforms.
> > > 
> > > What would be the benefit of having more than thirteen cooling devices
> > > declared in the thermal framework and having only a couple of them mapped in
> > > a thermal zone ?
> > > 
> > > I agree there are more TMDs but if they are unused for the moment, why do we
> > > need to add them ? Can we do that incrementally ?
> > 
> > That's what I am trying to understand: why the implementation uses only
> > the selected two devices, if the modem on Kodiak supports others. How
> > can we find out, which TMDs to use on other devices.
> 
> My understanding is that is an initial thermal setup. Gaurav will add them
> step by step while setting up all the thermal zones instead of sending a big
> patchset. And TBH, that will be much easier to review.

In such a case it should be noted in the commit message and/or cover
letter.


-- 
With best wishes
Dmitry

