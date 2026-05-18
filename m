Return-Path: <linux-arm-msm+bounces-108085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8G/FFo6MCmpu3QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 05:50:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7555565845
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 05:50:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53AD9301E6EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 03:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBAF037F00A;
	Mon, 18 May 2026 03:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oc5P9+3g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BubzTdjg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514F435836A
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 03:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779076232; cv=none; b=iznC9Pngdyj7aJKjraADaKbjGCTVUGtoNbH6Z2iLikqaqmhYshh0XE9mLDDfbPf0sYx6ruLsjCkn2InwxCug5v1TLNL4Scs1KsPt7qcl4ZKP55BKglJ3D1UYadoSHrgeME1IFRkpe8v4+Krbw3QnfM58FBQYYy5mHsG5eAD99Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779076232; c=relaxed/simple;
	bh=SM4oKCiKBPp6qapZUdx0yHfo2xqa4gN12OmIZo+C2VM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KAml3Ob/zPbccjRqGR0Lr0iX4ZoRAN8QKfTCKrMpCiXmv2gtTDg2qGFtzas0h8fZyJqL4umZGNk/2HyG8gXBaIQ+Ly0yI3Uxh7VssNBOA0lGZcapBBwIY6vhp5ffoWZgME+xn0gB8xxAJHUzFubhwRSWTz22Zl6QK8mwV8ymdq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oc5P9+3g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BubzTdjg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I3G1IQ4083010
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 03:50:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xedUXiNkyCvWr4jy/hXS2Hge
	j1kbvRVTt31eOPGYa7I=; b=oc5P9+3g+A1FNc0d8top8UrRpgbG0xig6eNhNOi1
	ssg3USXHRuLDWLjGX9su1OmcFZ0yhlWV27iFibZIBbigsc1uG8j+LAdYNNnKKTP7
	0/XgBibd0TI3Qts5fi10GYGitYW2jcCNcz84BA1pMgnJU2Tq9z6MY+c3uDXiUFDY
	uhERiYUiPdO3up/6PunBXyp6pOH2419Amvgl2aSly5vwJL8KDrITJaLUyiW9rklp
	aw1w7mQJgdtfJuScthsQcmN2yAzh6rXRoGuikWLVbNZ6+2RTbjY3jLokIqWxEuQK
	oVxF3naO1dgWMXA76yZoyMXucvMmnF+oLGWCDxIGGu0c8g==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0qcd88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 03:50:30 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1353ac304f3so3305293c88.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 20:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779076229; x=1779681029; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xedUXiNkyCvWr4jy/hXS2Hgej1kbvRVTt31eOPGYa7I=;
        b=BubzTdjgdTvnDfxJu3tER0MQ+vx8RymynYgftFGxJZ+zHMwkhLGpr97o70bzxc6mVL
         g5CldaIB6IqysUwe/OhkbOv9hKZp8SoCFAslaOYrSXvDZQTUKoDoUvxD4MuAGOIl7g4v
         iB887z4xf3pLYbfVthIgaN7wAAt4rwM6CIefCstVKpg7prvcr2k4dFFlZG1/gRnRn69M
         Rk3HANqliwJTeZeUSqfEM0JG4zfBvdPBzeTc9pmfxGGQGjqoKWDaJ6Je6ky+e79hr7Pa
         vJ1QW+owi/aZhWP9oKTftL5lzhZ2oR4NNOuMM416BC9QnwlQpj2iRyONmbg3yZObXE+c
         H7/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779076229; x=1779681029;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xedUXiNkyCvWr4jy/hXS2Hgej1kbvRVTt31eOPGYa7I=;
        b=htKPvE6uYSdQ7sIW0dJ3zyC6wTdHZqkvimuhrg5SbZHRdbNCbBN6VZQKS+UJXS55g+
         BufKt1PyoNfs5P84BgtyRcin1pB/yosaln6SQFaPcO0mBhfal1j8IezpSyQB34VLHxSA
         ZhiOPTiL5v5rrl4qh2d20l8wHp1Xm9MPTZbZLDRUWum+zPoSKWfSQEMsTkmrvX0H2CiW
         EeLZoJycqAjPH75JbXuVwbkhww1rEqMaU84+KKkkPQYs/WsB12cxtiEewGJXkjl20V8y
         Csv0pv/K4Yyf8gAsyGxn6x8yTCy2flqdw1+CV+VGfGNgBMJqPRa1DRbhIx1/Ph6HIhzW
         Sd7w==
X-Forwarded-Encrypted: i=1; AFNElJ9P4ruq3mlj7NeqzFPqMULW0rtslMOIPmT8Qc0M/lyg4zGaLmaiRlaGQVpm+T8zP5VCWF28tUdmpgL4nIvb@vger.kernel.org
X-Gm-Message-State: AOJu0YzzkfmzRvaxov26ZXLV2CMEWi3iHPICW+hbYl/aHs+PY2S+IBEF
	ME38/KoLbZUb08XzIdFaJ02KLrixqIxCU7QpuIG6EqQTPfTrXjoAu3JTu4oJ7O4nICTWs6rq7Md
	d85Xun0UVbCzl2gmtl82P2A54dzk8XE0jp/66zDyFrQb7N9oLQQKbgrMPKr3g4X5w2W5h
X-Gm-Gg: Acq92OHgEGjhVKC8lEQrMKO8Dnfs7q2fA3WcoSRd/w22+5EeE9JLV1GZf6Sf843iYdy
	LFxRDv6GuC9B8Un2XHeRpwKLNVLsEaTNeFUPEb+l7J1u8y3MqidQTT9EwGsdzGCUOhh9pkmf0W9
	Eiuk4c/A5gc8NDkOoEaaKEbsbNpIQ/QmDifBlESF6Nll/cGitlSbpru1qZVOCpC/2Va+hgP2wHc
	pCEJfG40iNSbDGKgIQH9qJsgn61GPvN84taprayL6Qzcse/Mb8hYGXaX8XvBRKkDPbaDrkq9o4q
	aHOFhdW+s+83oDE5AgR/kAPRIQ8CiEHSUgT4e0bbjI1IGPEowwSpXvHc3ha3U2sp1DXSiiyDeeM
	JblSclWcMkYKpwpiQwd/Hw0Crq82p2AC8yaE34g8oFm4ijK4C2FD5yfyWI0iTpOcqhKy1
X-Received: by 2002:a05:7022:f97:b0:12a:6fb7:87e7 with SMTP id a92af1059eb24-13503cf183amr5453908c88.0.1779076229083;
        Sun, 17 May 2026 20:50:29 -0700 (PDT)
X-Received: by 2002:a05:7022:f97:b0:12a:6fb7:87e7 with SMTP id a92af1059eb24-13503cf183amr5453888c88.0.1779076228518;
        Sun, 17 May 2026 20:50:28 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc33a67csm18063941c88.13.2026.05.17.20.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 20:50:28 -0700 (PDT)
Date: Sun, 17 May 2026 20:50:26 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: qcom: Add QREF regulator
 supplies for glymur
Message-ID: <agqMgkRwKqr05rms@hu-qianyu-lv.qualcomm.com>
References: <20260506-qref_vote_0506-v3-0-5ab71d2e6f16@oss.qualcomm.com>
 <20260506-qref_vote_0506-v3-1-5ab71d2e6f16@oss.qualcomm.com>
 <20260514-outgoing-literate-dove-2e2a73@quoll>
 <aglUmonGmr2goyOI@hu-qianyu-lv.qualcomm.com>
 <408f587b-76c2-4fdd-bbe1-89414270b4ee@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <408f587b-76c2-4fdd-bbe1-89414270b4ee@kernel.org>
X-Proofpoint-ORIG-GUID: QcDTi_1Gky98v6hSgGtmzfM8zKJwN_er
X-Proofpoint-GUID: QcDTi_1Gky98v6hSgGtmzfM8zKJwN_er
X-Authority-Analysis: v=2.4 cv=fIMJG5ae c=1 sm=1 tr=0 ts=6a0a8c86 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=UOvTEub72O79xdH0gdwA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDAzMyBTYWx0ZWRfX6WredmYy8pU8
 k9MtZj83yo8/gQBQ9qBE/pgvRCBn2JEmQoT2JCTBqO3d+MUBEax2m3ONKy6lZ31Pr6Ps4VHYmei
 hEBur/l9q7UqTnBZusU/DAUFHRWHtiS44Y1L4wI8HjFUPy/u+J73lz5INYZbzeaxMN9Jr21VRMl
 EAj2cyk+4h52CguVgj4If3pEqvNJQLtk1SUijX1gxbqKEw49AO0TOO0l3WFwQg9Sj5wrEWfIvdj
 wzBK/kE5eLgtKtjC/7sBcF48ZvyBCLTHIz9tYSV9itz/LVfV41gGJi84uYF1vVoVkJholqWJwR/
 KYEivGTnF/iYzRexjFOFKFeb7mc8+yd0YCRNfQMj+NAZk02yqdV3Lj61ocdhLYFO79beHEYvbVD
 tis30TcN6zSEVCS1ynAmg+UreMyOpMF6wruzmqy4r/Ud0AIgSlg92Fq3Lq1uK+tslQVynfojOOU
 N6azrmlrfSaXaeV02XQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180033
X-Rspamd-Queue-Id: B7555565845
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108085-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-qianyu-lv.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sun, May 17, 2026 at 10:27:39AM +0200, Krzysztof Kozlowski wrote:
> On 17/05/2026 07:39, Qiang Yu wrote:
> > On Thu, May 14, 2026 at 12:22:17PM +0200, Krzysztof Kozlowski wrote:
> >> On Wed, May 06, 2026 at 01:43:51AM -0700, Qiang Yu wrote:
> >>> Add regulator supply properties for the Glymur TCSR QREF/REFGEN blocks
> >>> required by clkref clocks.
> >>>
> >>> The vdda-qreftx*, vdda-qrefrpt*, and vdda-qrefrx* supplies map to common
> >>> QREF TX/RPT/RX components, while SoC-specific topology and instance count
> >>> differ. Document them here for qcom,glymur-tcsr.
> >>>
> >>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> >>> ---
> >>>  .../bindings/clock/qcom,sm8550-tcsr.yaml           | 57 ++++++++++++++++++++++
> >>>  1 file changed, 57 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> >>> index 1ccdf4b0f5dd..57921cb63230 100644
> >>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> >>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> >>> @@ -51,6 +51,63 @@ properties:
> >>>    '#reset-cells':
> >>>      const: 1
> >>>  
> >>> +  vdda-refgen-0p9-supply: true
> >>> +  vdda-refgen-1p2-supply: true
> >>> +  vdda-qrefrx0-0p9-supply: true
> >>> +  vdda-qrefrx1-0p9-supply: true
> >>> +  vdda-qrefrx2-0p9-supply: true
> >>> +  vdda-qrefrx4-0p9-supply: true
> >>> +  vdda-qrefrx5-0p9-supply: true
> >>> +  vdda-qreftx0-0p9-supply: true
> >>> +  vdda-qreftx0-1p2-supply: true
> >>> +  vdda-qreftx1-0p9-supply: true
> >>> +  vdda-qrefrpt0-0p9-supply: true
> >>> +  vdda-qrefrpt1-0p9-supply: true
> >>> +  vdda-qrefrpt2-0p9-supply: true
> >>> +  vdda-qrefrpt3-0p9-supply: true
> >>> +  vdda-qrefrpt4-0p9-supply: true
> >>
> >> Either I do not understand your previous explanation:
> >> CXO -> TX0 -> RPT0 -> RPT1 -> RPT2 -> RX2 -> PCIe4_PHY
> >>
> >> or this is still wrong. There is no TCSR here, so this proves nothing.
> >> If TCSR is TX0, then you do not have five of them...
> >>
> >> My previous comment stay - you are not describing the actual hardware
> >> here.
> >>
> > The CXO network "-> TX0 -> RPT0 -> RPT1 -> RPT2 -> RX2 ->" is referred to
> > as the QREF block, and each component is controlled by the tcsr_clkref_en
> > registers.
> 
> Still no clue what this -> relation is. Again, describe the hardware.
> 
> > 
> > If a PHY receives its reference clock from QREF, it will have a clkref_en
> > register. However, this register may be located in different regions
> > depending on the target. On glymur it resides in TCSR, so I added these
> > LDOs QREF required in tcsr yaml.
> Registers are not described as supplies.

I'm not descirbing register as supply.

    tx0-0p9/1p2  rpt0-0p9   rpt1-0p9    rpt2-0p9    rx2-0p9
       |             |           |        |           |
       |             |           |        |           |
CXO -> TX0 -------> RPT0 ------> RPT1 -> RPT2 -----> RX2 -> PCIe4_PHY
       |             |           |        |           |
       |             |           |        |           |
       ---------------------------------------------------tcsr_clkref_en

These components(TX/RTP/RX) can be disabled/enabled by tcsr_clkref_en
register, and they require power supplies.

- Qiang Yu

> 
> Best regards,
> Krzysztof

