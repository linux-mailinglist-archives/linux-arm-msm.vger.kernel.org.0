Return-Path: <linux-arm-msm+bounces-107595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIRFDujHBWrDbAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:02:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C87D542112
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:02:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 00E7E304FF84
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 13:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B408C3C343C;
	Thu, 14 May 2026 13:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EuV1NEue";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y+bXX70Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CE72066DE
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778763694; cv=none; b=StlvvG/xP+wdh71mt8giVC2jT27dQCNknAJgUJvP3f17EK+R3+1byUg7YLx8TuRnwZmTSQ60IxVbbCWfZB01bCzJaSdjKCxVl+RNB1VrDErWkJoGhutVvqLjeXcD7XgQSMmtCrmBSuHtvPARG5RHM16A0HV7lIDJTkxqgAZOVH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778763694; c=relaxed/simple;
	bh=GopKziKFwXkKALP/c/zJEtfkD8QeLMTwCEZscK1owqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O/8YHF/IBzTTlxr78/IqfbEdtDcb95TsRKeozR5xvoHrZBuhPqQZ4eUu/cUAq+aeTMKJUoglpmWJtFqDsNS0a/kZiFvJnbsAvmXP+4jZJLsgvz8FAmHm7Y8u133P0zKeTUJyJ5mmmEb1NT2sNMdNXtYdb2/Xff4wt4sGRUSd3kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EuV1NEue; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y+bXX70Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeR8P2713173
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zUoC87TXNaQE4Aqaw3Eteqzt
	vR3mU6hzvTnCxp1TRNg=; b=EuV1NEueWRJHyt9/tpOg0KbTJyy1wgMZDjAAhSt1
	+BSMSR4/iglXr/M44xs+F73rG+8zKIBHBG0dq3AvYCbJTuHF+KKeIt7AIBb8Jixb
	duIyETqXKxh7WkI1GGhtz34Ci1mCOhvJaXGTKiQRWFk20dwX+GWWZSrg8+u2NqH4
	4xf4p803iKqK9d/krt9FI2rG0NXHVVvRPshfEUZdXUmROBsjIKS7XP9ux++AnkeC
	KYfbHHVTEqJQNZMXzUiBrRcSaQFmNETqDN9lJg5hgKClNzBJuVfmCdOQht6D6eli
	bahH/yjFYMs0+CmgOhXY6Ssm1pLu133xIEHs9UVmm5M6kw==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e58v89b1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:01:28 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6966f1f4490so17692368eaf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778763687; x=1779368487; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zUoC87TXNaQE4Aqaw3EteqztvR3mU6hzvTnCxp1TRNg=;
        b=Y+bXX70Qp6xfnevg1tsIYljRrwAgcfVWNJ75q3Xr8vpoJKgPsp0HPk4sGu2xLnOFhS
         O+zoVlj/1K6eIn9Ri76y/z4tdSvAsUvTzs466g9Zgps1ibAt9oX8EHBcoIaARoL5lkEc
         n4rWQJfHVO6HeZMYYj0wNY8LXcgT5dw7uUaSyB9TBADgrYpY7APLGulqRhvJjwtu9MOF
         f2EbamdGly80atB0QpsUGIjVXgncmubDfRAM9/XrjYI8qt1zIsIk/i17IHCg56aa2z32
         xu9ihR/SHRlLzhaVnOfJKSQ18THrgC/SX1cxWrgzo2L+hoy4BpKGKZ0qo9xhnEEUTRUj
         GgCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778763687; x=1779368487;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zUoC87TXNaQE4Aqaw3EteqztvR3mU6hzvTnCxp1TRNg=;
        b=ZVcafu+zAV4tYREhphpulE9cCTLNFqVP6hnbgxdims6j87mLmRiJ2oNeGdt4xHaxax
         ZfO9jYhHcok+l2kV1Kkh8i2GsQ1LQXyjPMKe6wHUyyB7PjumKtfLZckUTBXpvj+irkda
         JOZg5wI2t31O/TTWVUF/PwnQTHOersbsNSU6HYOkgrohBsorduVLHeldsqT+8ckDJOdo
         ezYAQL+0TCcq/LbgHCq9NWTSFVmB001ER3q0pRJgLEW+v3dieAo69isW/tXS0KubEgqi
         t/4bpEVHlZ805vfCm3ykbmtyIlWl42diqr8N7zZBrYEG2MnlOZsKe02aXhnPc3JWT2ec
         qBcA==
X-Forwarded-Encrypted: i=1; AFNElJ9F6d8lgOIfard9BlKkzn91PPB0W8QKWAfNWfp/1WbkdNR6aRO9Gz+8KcUoilEbClzKRWxoLz7O+wQtn8wM@vger.kernel.org
X-Gm-Message-State: AOJu0YzWQuDMiKwCLlbzMKzz770Xdt0ZDVmGGAYjEArglfkFj+aYZjvM
	3+9w6nAEVJGqLPH93XoBGPAlMaxN1LtmlRB1i+EsX8Rr5uNlKqHMfVke7b4Sz6XYDWzNrTTjpLu
	mgMWk503sWf93A3OHVPsfGpxAffXtvhj/4xd1SH4Zj9C2r646xKBUppbhoD4xFCInus8D
X-Gm-Gg: Acq92OH5aXhPN53/LW9zqULK8y9uo1RmkZUkkJmq8PA8QEkLUZnJSQJUOXBQqHnYY6Y
	tMofOFltWy9oMG4udoJWk7Cxs2j9hE6Z945VNQ3GJH1KtOGiF4mZARa8MoJOq21i+gnPsuZC1o9
	cLSbfEwx6LvZGVaemC7CGwk+gnFfM7W6gwKxlxRy6Ajw1chTeyeSYqnu0ZDw14Mh6oxVjyB5n/8
	6LtzMyJfihW7gCSIcw5LlJY3yt4g92wQ5kTTEYyPVxVDHIOYoRCNgwJ4l39yKIDEOxOSHCsTc/b
	Qt+mf0OBMO5DKeAcYo5bSy6eLeqBsYnTJvmEh80OfRI6Pj3z/yKyhIWuGhDIJ9f/qFLmnbJvPBV
	IB/iLLHWhGKDJEij1cUZ4s4L+MSrgdUwJJiYO+Ne9F7LSnnw=
X-Received: by 2002:a05:6820:2ac2:b0:699:b2a2:9150 with SMTP id 006d021491bc7-69b885c933bmr1569280eaf.42.1778763686692;
        Thu, 14 May 2026 06:01:26 -0700 (PDT)
X-Received: by 2002:a05:6820:2ac2:b0:699:b2a2:9150 with SMTP id 006d021491bc7-69b885c933bmr1569033eaf.42.1778763683496;
        Thu, 14 May 2026 06:01:23 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fd62b55f7sm20278845e9.3.2026.05.14.06.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 06:01:22 -0700 (PDT)
Date: Thu, 14 May 2026 16:01:20 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] interconnect: qcom: eliza: Add SDCC1 slave node
Message-ID: <7mrqg5n5yn3lps63y6f33tpeccj45ifoe2smn266ouciwwzyuu@onttafl7v2dj>
References: <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-0-b1edf81bac3b@oss.qualcomm.com>
 <20260512-eliza-interconnect-add-missing-sdcc1-slave-node-v1-2-b1edf81bac3b@oss.qualcomm.com>
 <0aa79750-ac75-4111-ac82-ad5672157c90@kernel.org>
 <3y7hyzwy7n5yqlmyywyuls374j55i7aqfgyiuabf4tubu7slut@pnhrvqulz7dh>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3y7hyzwy7n5yqlmyywyuls374j55i7aqfgyiuabf4tubu7slut@pnhrvqulz7dh>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEzMCBTYWx0ZWRfX1pFkb2z92bJo
 aRIeJNbIGvzRYKgOU5XkfObOKqrTBhHVDZCrY/rWkGY3YqRHPQL9IhTctpVMcSEZcc/8Yo6G+tD
 0Y/9Zg41TtYe/h5R7H2fdH407Z3KDG7Sky31ttF5NAWu+kijpka/ezeCzWq6qk1pVPChzGo2BXB
 dgw0pa4rAvdAD27lZ3VAJ1DjhnBjjFODawc9bLO9JS6F8fXqdOJgCxk8fVL5ra1jKIulpfj+Tf7
 SE4JSe08rWD5d7fjyrG9HAimUoHO+xbJerLz+hoYmQk91RepBBS05T4ADTfoThu5tec6XnF9w21
 jhlojEv4Vx+3bDdj3uB5Ckfdd1cKWVAtu6E19TlkJfhaGUl9Sxdr+b9T/TM3T5ZCi/IU8uvkskv
 LmzwF4M7QQQcqGDUXfaxhOAtAo5SKA==
X-Proofpoint-GUID: wc8scUL5B-q6L8IfE9cj_VH9LrDBEd6k
X-Authority-Analysis: v=2.4 cv=YZSNIQRf c=1 sm=1 tr=0 ts=6a05c7a8 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=NtgjAHhJo3Q0P2g9Zl9R/g==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=zvVpzuEAzJinQkndZGQA:9 a=CjuIK1q_8ugA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-ORIG-GUID: wc8scUL5B-q6L8IfE9cj_VH9LrDBEd6k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2605050000 definitions=main-2605140130
X-Rspamd-Queue-Id: 8C87D542112
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107595-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 26-05-14 13:39:24, Abel Vesa wrote:
> On 26-05-14 12:52:21, Georgi Djakov wrote:
> > On 5/12/26 3:18 PM, Abel Vesa wrote:
> > > The Eliza interconnect provider is missing the SDCC1 CNOC CFG slave
> > > node. Add qhs_sdc1 to the provider node table and qsm_cfg links so
> > > SDCC1 interconnect paths can resolve to a provider node.
> > > 
> > > Bump the qsm_cfg link count to match the new entry.
> > > 
> > > Fixes: a39efc80ff50 ("interconnect: qcom: Add Eliza interconnect provider driver")
> > > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > ---
> > >   drivers/interconnect/qcom/eliza.c | 11 +++++++++--
> > >   1 file changed, 9 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/interconnect/qcom/eliza.c b/drivers/interconnect/qcom/eliza.c
> > > index a4f7903f0524..6d12a1c3c034 100644
> > > --- a/drivers/interconnect/qcom/eliza.c
> > > +++ b/drivers/interconnect/qcom/eliza.c
> > > @@ -127,6 +127,12 @@ static struct qcom_icc_node qhs_qup2 = {
> > >   	.buswidth = 4,
> > >   };
> > > +static struct qcom_icc_node qhs_sdc1 = {
> > > +	.name = "qhs_sdc1",
> > > +	.channels = 1,
> > > +	.buswidth = 4,
> > > +};
> > > +
> > >   static struct qcom_icc_node qhs_sdc2 = {
> > >   	.name = "qhs_sdc2",
> > >   	.channels = 1,
> > > @@ -383,7 +389,7 @@ static struct qcom_icc_node qsm_cfg = {
> > >   	.name = "qsm_cfg",
> > >   	.channels = 1,
> > >   	.buswidth = 4,
> > > -	.num_links = 29,
> > > +	.num_links = 30,
> > >   	.link_nodes = { &qhs_ahb2phy0, &qhs_ahb2phy1,
> > >   			&qhs_camera_cfg, &qhs_clk_ctl,
> > >   			&qhs_crypto0_cfg, &qhs_display_cfg,
> > > @@ -392,7 +398,7 @@ static struct qcom_icc_node qsm_cfg = {
> > >   			&qhs_mss_cfg, &qhs_pcie_0_cfg,
> > >   			&qhs_prng, &qhs_qdss_cfg,
> > >   			&qhs_qspi, &qhs_qup1,
> > > -			&qhs_qup2, &qhs_sdc2,
> > > +			&qhs_qup2, &qhs_sdc1, &qhs_sdc2,
> > >   			&qhs_tcsr, &qhs_tlmm,
> > >   			&qhs_ufs_mem_cfg, &qhs_usb3_0,
> > >   			&qhs_venus_cfg, &qhs_vsense_ctrl_cfg,
> > 
> > Should we also add the sdc1 to some BCM?
> 
> AFAICT, it should not. Even downstream doesn't add it.

Actually, in an off-list discussion, it was pointed out that sdc1 should
also be added to the bcm_cn0.

I'll do that and resend.

