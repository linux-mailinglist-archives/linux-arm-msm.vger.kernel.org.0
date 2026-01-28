Return-Path: <linux-arm-msm+bounces-91000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAlDKMr6eWkE1QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 13:02:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B2EA0F54
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 13:02:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E433E30099BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CA2D34E741;
	Wed, 28 Jan 2026 12:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CVYDHi4B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i3L7cABD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38C6238D54
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 12:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769601726; cv=none; b=JQt5e1mm02dpM8t5dCtGjfb9NPJ0SA0ZlXt3h6uCeJ8fD280+0IyFWzpL0wzZu5fHmejVJdJYck54ckQWFps00Tgj5o1X0QtWsann+qyXdlhxFQ0k8Trhs200I0Mvutkp9fflgJARa7BCZ1e7+zXPEvMk4lH2aXsd4rQYI2N52Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769601726; c=relaxed/simple;
	bh=JLyNkkaApmbrvqwGZzopsyQy3SF6cnsEonoyInku+lY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=so2gGUrWopw07B0rPs3+O2eIIrcCzX418+5YsAioAxEstUz2PSHTMn4NtKEiYwI7aiTpoulTA7vrXY9CfFYjliWUj/SYniQsbCLx7bGNHCh0CsU6tSh5LsUuL/vX+86UdTbUPLbJG6QRlI4iynokftyTt3kecu20i3ILZgCOgFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CVYDHi4B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i3L7cABD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S92RnR3907616
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 12:02:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4es4CQ2kpzllBPGDjkRDsz38
	DYsO6uydqaYWOYELKK0=; b=CVYDHi4BAq+0QRi52BLyrPXm0ipyvtB9DNZJBYEA
	RFIKVSsImngsoGZF597jq97Do//9iP3DMsYIrrZHVspp2+VQ+Rbinjps/iaQ5h4Z
	6wdb3UTDxvIJK6k82AKO/Fpes4j/hc0xoYKTAbvVqfuCrWqy1PmLeejewjKTYuLq
	P6kTmX3ExEbJuRTC1ED276HrUc8A9wjqRElGRNWmwk3zeB8/+TJeNdGUvo+jnDVX
	nxUeg5ujUqNgVnu76PBgPRDFsSPqW41hxADkOa+fiHs7LYaOFZFxcAlMF03TAs1W
	n6eCRSKwFkUe+xnGb4Ie+dIX8TVUZUrBzipR/N44FWC0Iw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by0g0bpex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 12:02:03 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5662a8c5976so7430652e0c.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 04:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769601723; x=1770206523; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4es4CQ2kpzllBPGDjkRDsz38DYsO6uydqaYWOYELKK0=;
        b=i3L7cABDXBtt2T8nfnkVkAYBk+qsv9Df58lYHXKSywHAdwOMc6OIUI7PJ3KuwrWHCW
         RgBLUde3n8tm3SAU2iQh9KzjuakPeS4cMOmhrYUoIsvw/6cmWroT3/1D6ei86tkuIJ+s
         7/BAlGdTHonUeNjkc004nigj2JwczICUFkaoHmf6GITUDykgpA9gb/R8WHWb9tta7Ymo
         XHcvQC2y9EK/Zw8uja+I6MoBSwMmsb4yES3QVr7p9WRZm5NwD4DfThhMgtxYTQlz6MC2
         9aq4oqS6aB36LYFA/x1Gf+7GhtFocdSzVochtutOUTahddY2l2bl9FD3BoJxHUuwW+t4
         TSzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769601723; x=1770206523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4es4CQ2kpzllBPGDjkRDsz38DYsO6uydqaYWOYELKK0=;
        b=VPZC3XGNE6mcntbmloBgT3SfRXJ4kk18yf3Xip2HZ+ViGIHJUFCoBYp1Ln8oxdHIY/
         8rwLX9w4Dsl7Tcjf3nWOBVayuG3kFxA6jf5cWJyvskpoDc9O0pDuH9b/0Td+8tVVpKcu
         fdPAe/kV1wvAnVNh0pE6w00zcQzwdKVTUyCyJrjOSfCBHVV+ZWzQSRqVHt1nIVptZDw+
         YgmX1g13ymtRZFGQVsuGlQCzLFrbfzYnx4hWbF1yNUY0fEnB5ZXLJvepj4EtiWNmqKAv
         WenmZ1Hu9516W96O3BcNx6R+hK83SEr8USGElWWogVbsfugCJHrLXDe3RQ/wzpXQGtpM
         SyfA==
X-Forwarded-Encrypted: i=1; AJvYcCUQSg9DvqdpuzbQO/U08p76+A40yuYQY+AqATR0whvkNnrTseQ3EpjrhzjITovc8WsiRMLLPXCZLoK+iEfJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyDm7z6dxlE4246gZuMvhWOhEvBXIPfExvCGjC/mTHJ1xMDn3ds
	tJN5ANDPspukl0oM3/6yG6Zh8K0buFXT4g/jm8yfs9GhGf+BCmOj3BIOLDEmvy4/mKoyXdQ31Pm
	dCj/nVNmzzLlpaeaCiT2z5oCjWda7NuhfpmsBGGKo/teOxZBm4yXpkIrUAaXrj6duzd6K
X-Gm-Gg: AZuq6aI5i+p9rCl9eYuvh9xWL5dPC68FJhB5nNh6uOk/UuIwHMn2/KZzPU+E57GjtvW
	c2LA6ua1HsHw/H9MwyBvCAK+EQvUr2E9rvX6LFgnf7XiC/Ysko13EdZAQYQz7K8HFYpJ1WjgBPn
	N5z/OxOztnMMiqCJO2bOv996iGY8ulnhM5l4WEgwboRvDya4Tjcocs7nivTXeqkeg/QK70n0DvR
	Fop43BgZbS+qyxSXA7EqDG9XERKA+Urn8ir6DX/da31Qr1luxrb2oNet1F5S8p5RvYy2vahtW7r
	DSRnTjbsuwdmhYlJ//C/W/Gd2izYdqvhU2DkXLiegk+Ug2KIj/75rx7m+nLyBHkmnpB2W0+iV1n
	F+06Ifq0vJjYYJ1zxQo+yLs3I
X-Received: by 2002:a05:6122:7ca:b0:563:7d93:b135 with SMTP id 71dfb90a1353d-566794ab056mr1252889e0c.2.1769601722673;
        Wed, 28 Jan 2026 04:02:02 -0800 (PST)
X-Received: by 2002:a05:6122:7ca:b0:563:7d93:b135 with SMTP id 71dfb90a1353d-566794ab056mr1252834e0c.2.1769601721973;
        Wed, 28 Jan 2026 04:02:01 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e135422csm6553300f8f.40.2026.01.28.04.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 04:02:01 -0800 (PST)
Date: Wed, 28 Jan 2026 14:01:59 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/6] clk: qcom: rpmh: Add support for Eliza rpmh clocks
Message-ID: <bsaj7umwdw6teu5tsuptbhsymo7aeorlqlnzayvlvqjvrhmwtd@axabgagssltv>
References: <20260127-eliza-clocks-v2-0-ccee9438b5c8@oss.qualcomm.com>
 <20260127-eliza-clocks-v2-4-ccee9438b5c8@oss.qualcomm.com>
 <734ae332-e1c6-49d8-9f10-a68e84360ab7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <734ae332-e1c6-49d8-9f10-a68e84360ab7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: BCeEMJMIYZvO8hwd6jtAvWmUlBNO5FUj
X-Proofpoint-GUID: BCeEMJMIYZvO8hwd6jtAvWmUlBNO5FUj
X-Authority-Analysis: v=2.4 cv=UPXQ3Sfy c=1 sm=1 tr=0 ts=6979fabb cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=J-NJh31Enpt0SH5wFCgA:9
 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA5OCBTYWx0ZWRfXzRqvzHcuBJdG
 6KpVRymUUZhXBF5eEOMgP+pCHFMN7dt2/3EmaphkzxbKl5+bF+p8q9Vh7WSn3f15YyR85BZ/XPX
 vJYB4rShs4Xtp1ELo7SZrOgSs5lUdGDDLHkJW52IczwANL8w28LVh0UftHAaHZKkXa3NPwtLodg
 nYxje6A91Jt1lqdLd9NVWxDRDbCAi9VaaCK/MS591rGn3OzumKCbWSFgk+BW+3+qUhDj1lBxeOo
 /4d50Sy5zjmZWEoTkoHtLQJEFMg7TcL30OBYpfL1H59WqZVVEQccuBVgyMFM1PtqtRV+bOPqUdf
 i1osQBBpgfp+uVdGO1F3mOcHN5GKhhesMxZcMBDBwl5Q/0/+pGHQTzhYXKGfEHLu4c3edIxLdIK
 9u9FO0+LYmo3HcRbDADCZ3HmevcW9TtzTa5HnoCodeF66q/rgQGmkTzzoaS2bEVhR+aFKBOlgm+
 lnLrDFeQU+UPpMaGMIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280098
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91000-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN_FAIL(0.00)[114.105.105.172.asn.rspamd.com:server fail];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 80B2EA0F54
X-Rspamd-Action: no action

On 26-01-28 11:40:23, Konrad Dybcio wrote:
> On 1/27/26 4:03 PM, Abel Vesa wrote:
> > From: Taniya Das <taniya.das@oss.qualcomm.com>
> > 
> > Add the RPMH clocks present in Eliza SoC.
> > 
> > Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >  drivers/clk/qcom/clk-rpmh.c | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> > 
> > diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> > index 547729b1a8ee..cf46a6585174 100644
> > --- a/drivers/clk/qcom/clk-rpmh.c
> > +++ b/drivers/clk/qcom/clk-rpmh.c
> > @@ -940,6 +940,25 @@ static const struct clk_rpmh_desc clk_rpmh_kaanapali = {
> >  	.num_clks = ARRAY_SIZE(kaanapali_rpmh_clocks),
> >  };
> >  
> > +static struct clk_hw *eliza_rpmh_clocks[] = {
> > +	[RPMH_CXO_CLK]          = &clk_rpmh_bi_tcxo_div2.hw,
> > +	[RPMH_CXO_CLK_A]        = &clk_rpmh_bi_tcxo_div2_ao.hw,
> > +	[RPMH_LN_BB_CLK1]	= &clk_rpmh_clk6_a2.hw,
> > +	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_clk6_a2_ao.hw,
> > +	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a2.hw,
> > +	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a2_ao.hw,
> > +	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
> > +	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
> > +	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_a.hw,
> > +	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_a_ao.hw,
> > +	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
> 
> I see that downstream also has LN_BB_CLK2 (clka7_a2) and RF_CLK3-5

All I can say is that those do not seem to exist in cmd-db on the device
I have access to.

