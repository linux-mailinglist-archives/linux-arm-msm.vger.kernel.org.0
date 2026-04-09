Return-Path: <linux-arm-msm+bounces-102422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNQ+Gb5Z12lqMwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 09:48:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BA23C73D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 09:48:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 626D7300683F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 07:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7399A3803CF;
	Thu,  9 Apr 2026 07:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VUnecfzA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rhmla1JX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEEF375F6C
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 07:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775720892; cv=none; b=tSdE8OeBrbSGouybUCCOsWF4AZDucNz2WcwexjcwK9tHTxuzDDLCrcEjM7b7hEhUawaLgSQOjkDaDnTAYZ/xmEU8OJHBgcfj/drVsCZH+vgIk0Ox+NQNQpFhXpi+9skfrQ2Vus5nSzvoDij1skcmEhExR0lyw5lXksMbRrz3Z80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775720892; c=relaxed/simple;
	bh=ZoM7TDWvbqDUnnXcuUVO9LsEhB1Raczmr3T+PIhxzbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eEY94bpZf4F/yP0T6K8omdnoeQV5dMKZOOyBe7BHpm+ORL49M3XW5m+PfYwiPhXcodzpGqVVgD7zqBE+XXCc7Q6zD/8ft+BdwEIyfWYVnnLzBz7umuKmd/ZcGot2rW+HVzfO4k50+YhmJB/MPKw1XAyJNsg7aUqO+9bN1qlDDc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VUnecfzA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rhmla1JX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6395CUEe3535075
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 07:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=a1B9CdzhUeVmz7rCCKalzgKO
	s0sz2BeqY4Qic/Nq5Ks=; b=VUnecfzAal7bgmB3bk8QpJDklOwNTiZZ1BiKex0a
	czfw0HMDUBXNLZQPhjNzvFJWOyHpKIPJJ0kbeFx4IVyh+EJGmEFJiWkhl/V4LI6u
	CyrX0rrqtpU+k8jRypBjRGzuoFMd6pgEPwovggO4re4Tpnddst5lHbh1d4FGkSxV
	hL+NyXHpmBP995CqS80QmahbA49t2eTXKMNWuwzdO5sBCj8TbZPexPrsmU0+Zf9H
	SLJpd9KpLq14im+ne78PF3aBPuilP1VsDCburzV8KzGEF4JqGqFppYN7JZBAdAzx
	2FutUbMjHiuJ54yXnlUqBXMX0qkXYFIOOp/uuu8mGYYTog==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddw9mt4k2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 07:48:10 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-12737f276a2so10445318c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 00:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775720890; x=1776325690; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a1B9CdzhUeVmz7rCCKalzgKOs0sz2BeqY4Qic/Nq5Ks=;
        b=Rhmla1JXrgsNUQRE3kXx1rborojvpPTSgRo61uSBO7/4jsffXy/FzOWLcZmaCqpq7M
         CM1KrH39Pac6v49NmUa8KJ7nnQCr5DD0HGLUym4piljKRkt96AJhHTjylqgcqcCvU8Aa
         LC4kcvf00fYAwHbRdoZ/H5GleNNHIPiFVXWv2QVkDa+eAgHr15CX7q3QCQF9gnvQJOhp
         IxGM2Aq2sG/tlueUabVRrVsUkM3QZMCipDVNNVH4DhnY/OVhX5wDrq1llsI7qRTYBb5A
         y4H5Lbw9a0h9Ef9zyqqE1hd8+VmueuGOHRemqwjJvdDPcag3kJj/PxMg5Sabs3IX3nxC
         qjxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775720890; x=1776325690;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a1B9CdzhUeVmz7rCCKalzgKOs0sz2BeqY4Qic/Nq5Ks=;
        b=mLAgMTwXjTQdu15PBz2OnCd7ekGCoB96r1Z1X29SfBV9JE+caVQgYK9Rrj9U9BRT1j
         CJwGP8kMTakEAcjPGi6f0swREcY02kaCNCfwWL0u0+RcYAsnb5RU3ojC2H+V4y/Fcb1G
         cLFsB17KhUZub8cSgfyzzCo0MAtM5udyRgz74NIJpFGIsNFIYRnDt5mqA3w6AKeDMgZf
         X8hUCb/7bKNnp9WECUHu80g/b2tpKhBxSCofFaDP4uPulWLyE+Dt4IzN+nTVhPSfzzH7
         9erAY6p09/rmumNKaHIrApNXNSyL/aX9JMyTxNTUgwyjlX83YvcQduBULN1MllTSgvIc
         70gQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUF4UpLysiZoBmAhWI/h4OfyCxbUT0O/xjLDilB7RVsMDjw0+Xtr4qavD+AvCZHbt2nMWjxvO25xr5kK0x@vger.kernel.org
X-Gm-Message-State: AOJu0YyJGqOhpExkxQy571Q5AFAl6eBCnwk073G8utj1KuhYAobo3Sr7
	RjlQir1YHY7JZVrNZFss9UPrLXbaOufTo9feGg9oShJDZToXPsnMbDOVeCJFykRdKBvAB7VX6Ug
	3fSV9lYZ1JIz6eTjtVEdZQlakuiPP2bWgZiS2YQ7luXdYB7fvFjpioEJnqkMFr74Ny3Rt
X-Gm-Gg: AeBDiespvjytEOFIBd+MdJWGFN+Y9CSEqKYzSKXJzrk3rD2rRdZw6X6d+6IFRJgJXfR
	TwzSugqUqArvEtEDII2993MJRpdujEbsFEdK8haPt7Y1NMsbaBZ7csdZhDrjs5u8ci6e/BnrBUu
	1U/dJK9inmHDpXX7XuIj1XUOzRf68lGq/E17VsFaobmPywlMi9ns+0M+91uc/fq6QyzbhhX/tf2
	l+pDufFyly9p976BYy0+k8A95IvtJ/TjiVfv3WmpqkBS4FBog1S0KrLZlLCKZMJ3iD434NvQxEQ
	eRmH3/DVyJT++94d5N4ukezu6zPbVcHBalGxlWsmTK1z/OoDGV3e2vrqOLsQ2fE7dSqOkSagjQm
	GV2svGIMWwl8Szp4j2eJkO+y3VKEdbjwW/nMN4ZdGi/bG3NOSrW818ezMNomTHJmS
X-Received: by 2002:a05:7022:62aa:b0:12a:72af:83d2 with SMTP id a92af1059eb24-12bfb7109c0mr11782542c88.14.1775720889811;
        Thu, 09 Apr 2026 00:48:09 -0700 (PDT)
X-Received: by 2002:a05:7022:62aa:b0:12a:72af:83d2 with SMTP id a92af1059eb24-12bfb7109c0mr11782523c88.14.1775720889230;
        Thu, 09 Apr 2026 00:48:09 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bede54ba8sm28314784c88.10.2026.04.09.00.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 00:48:08 -0700 (PDT)
Date: Thu, 9 Apr 2026 15:48:03 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mrinmay Sarkar <quic_msarkar@quicinc.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: lemans: Move PCIe devices into soc node
Message-ID: <addZs0XSe5WMg0or@QCOM-aGQu4IUr3Y>
References: <20260331090147.18522-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331090147.18522-1-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cfPiaHDM c=1 sm=1 tr=0 ts=69d759ba cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Mi0LQC5kIBAc4CHFT8sA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: OO54XBq1K9s45_pGp9eH8HBKA-RxLekB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA2OCBTYWx0ZWRfX9SupnlsfIIiD
 Xr14nFXtDY+pOWDzgirVkkg97y2O7Cxpg6yswkFqpk2NnIQfmLUZTalTp3PLkQy8W6JuEU4vsYM
 NZmQCbFkQ5E7RnGbX9zIwZmv1rcYtVNffqc4SEP2B+7Y2uZZ4M+xH09sulJnY41uZ5IQ3iKfkEN
 0tzIc9yTCj/lFrjmpMAoqPOQXtbzQSQNgnNj6f/mlnaUqEK0lSl+DsYco1MSZymRKbjmKUQ8ECE
 s1Uiy8ke2ZMwmy4PKrX4OyNyrrNE9IGIUY6m6NeE4xaC3UV4JtMgCzxHSEJmBR7EcU8mZpL6pzL
 p/mc0l3OKta3oGkt4CBDB5EhIaaJ1QobMjsRjW2IgIgLdpP8j84JfgPOmBA2yG5JO1c//QOcUFp
 2dAgaZ1/e0kuIz6zl7xPduhJWCudJ3fIqjRTQEE3wu+I3mpnMVb96aSTOJUqMjeOQm6yC86e4Fc
 tS2nPRmeo6ztRLdIhcA==
X-Proofpoint-GUID: OO54XBq1K9s45_pGp9eH8HBKA-RxLekB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090068
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102422-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 09BA23C73D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 05:01:47PM +0800, Shawn Guo wrote:
> These PCIe devices with MMIO address should be inside soc node rather
> than outside.
> 
> Fixes: 489f14be0e0a ("arm64: dts: qcom: sa8775p: Add pcie0 and pcie1 nodes")
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

As this is a prerequisite of my Lemans DTS split series, I'm including
it into the series.

Shawn

