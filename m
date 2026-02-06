Return-Path: <linux-arm-msm+bounces-92039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMZBENbrhWlvIQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 14:25:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D128BFE173
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 14:25:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 234B63053D6D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 13:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47E723D525E;
	Fri,  6 Feb 2026 13:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oYLKpI92";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YuVg3Ixy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFCD3B52F5
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 13:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770384219; cv=none; b=L+zCY2trr5jlBOSnBLH1puXOB00Az2A9bUWNMvkCC6U7DlMeXUulfuKWiaEAlnpboNnPy9XeMA1abpKKbgwOMDRDb2dejfSwDl6rW7NbRPjE2gncRJ5sheiy+EAcpxHJl1J0k6VsI2SEpfIaraWYV0AjrVHeiGcC//NumK3nd+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770384219; c=relaxed/simple;
	bh=fqZ8bqAlwUxBwe4Z1+H16jnykQV8yO9H8sw0Vqob/0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RKDwVj94zSQeug9bJBk1G90k76kISFLlnN6TtHZLjraoBQGmLMwu/YJM+ufndVwGOxRTn/VFYiFToa29nIxR6hMwwDb04zee3QI/1LSVP8fDQFCGu5yRQDVZuZfb5akVL1fYtjpy7jc4jLiQXnRb3ZmrllqQ9wfzKj4b4SP4jgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oYLKpI92; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YuVg3Ixy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6167pNre2489781
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Feb 2026 13:23:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Qcbx8hOqgZKgbdxSnQdVeh45
	s4d6AAaaCPjmsAiQNIM=; b=oYLKpI92S6Q7d7Cf1DrAwDVbpDZdYaJQHEEYEz8i
	q7+upvosTjWwB73AvGT/DpOKcSWDuqZsIRNc3KnITrFiQLJ9IuzuwLK1Qfe8SWt0
	xPKxsdF9JGSpyQg0voI3pl0/RVSfz+qXq5gSgvObQ/RiECziXWgbdOst8cR9u5jj
	VyrWYjteW0DrTXIcgYG0io0DMfwjIsWLAZaB2jGQQBJZjYo3mhq2bdmMDiGyAXfq
	jONDLiC8TLq+60zWtaHleduCLB62m34ekmTP6UM3zy19XRfBebWJeZ4HjjFecNsT
	YIduTS67LujAYsfXJfj4LtxXw00N9peEy8qZ1FjldKVPFQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5c9c10aj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 13:23:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a76f2d7744so22487755ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 05:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770384217; x=1770989017; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qcbx8hOqgZKgbdxSnQdVeh45s4d6AAaaCPjmsAiQNIM=;
        b=YuVg3IxyTS7DKgG4lVjz54J14oaNIMAFgY2VXC03zh1iYNiftCB5w/t5Uk9Dl/Edbk
         Asd5g/cRj7xPa2XAHV+SuRIFToUzeUlSnyYqdn/gHJqGdVrhmDkKQZ9vT29ntf/iIoFw
         S8+ySBkNtRM2ZWsMSr0kSXf14xxziFu0n1TO/G6UTryadQE1YHcaAXiHG6ZRFmxa0/Z3
         YHtxFaHL3L0oSMnKo98az484CkD6VK3NNGVvSzc/EdgZBzoz7DreaywLWgktu1um0dce
         CN9mA3MYk2VCSpsbMLs/B/rWkVEoe4A0XWrU26l66roVDSrh+BWCIr+vHMKqc+OXav17
         g+Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770384217; x=1770989017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qcbx8hOqgZKgbdxSnQdVeh45s4d6AAaaCPjmsAiQNIM=;
        b=Q3SDo7cjjU9p2GCaphbrNHNWnEPMChLBMcg3g15aA/uz1XNUcCM4lKb10WpujvG5UB
         llTep8aopsKFobayfhHnVAG54s3z/R0Bmd+lIF59OeLre/ULq9A6g8bTO6K6fiuRyPpT
         84oFe6cn2yM/DelmkEsV8DvBCXzGD+hIq5th3kHVN2VZVhc+e+PjbUaO8uqEIXlumtIN
         ndPApbIMnrBQmkApqGXmkLjuIDaq0PHPWqK9P7ZQTyOrtzRrd8VUdhTIVSu7jwDgFczW
         bwMAMY+aLbVqsCstilKyMyrn9UQHGSJ7qjljYGE1t1g3PgTRNZWg3kTqPRMWhHV/2QlP
         TeHg==
X-Forwarded-Encrypted: i=1; AJvYcCWkP4838NMvpLqyaSpCSGyCcyWHtDPlHxa1krmRHm0rnm/YaLFTbrUVg21xmq7xQ33rhDrRG7rCBJnwO49y@vger.kernel.org
X-Gm-Message-State: AOJu0YxjsxYTrNDiv8ZYUiQ+rxpV5IgJDgYxT+MeUTYz7GsxN4yRFcTG
	OuuePk0tmEL24hTazrq2zRZkBNiFQSQc+rXcWNcUiHTGJUy0DZJZ1bd+eI74PkU7wmceV3S0ejI
	w1/teLyCHAYFdU35qSWIKrRCa2XooV1S/cs7wKuXt9yEqj7Ilg4cL0EkD8dgIqxKXlHs+
X-Gm-Gg: AZuq6aLMqtk0mcAA71wWmoWdw17H9gOCAmIWgzg72EYAVZ6smxpZyNxrUa1WQVNKc8d
	93Z+wribmihQ2Dobhd61pAwKvd0C4GWlSi4rhY40Gz6lgcR/EgYs/sgUGo43UIHrTRYsmrkf3Om
	Wn+aXow0b26LbMdaxD97kFlqP7qAjq36j7Msukbi3hPcVACxAnp9XBH0qYpdxFg1nS0ctfp8Qul
	Y1pQP8J0q+rblJ7/wThRiGFjRPk6ETJUZzX0XX0Ptmq21dty7CWyPItzoQrPdDWQAKZua8PBp4t
	6nKdZIN0G7+Vj9Fs5SAUjaNgBd1bF7HuX8vTFkerUlzgjWzyZdAj8pLPZEJU2kdZDX/bHz86Cfu
	pCzREF1xJ8s7kya9cEcfhwVWJQzoZ0dmwsH8c6fj8bKI22JQ=
X-Received: by 2002:a17:903:244a:b0:295:c2e7:7199 with SMTP id d9443c01a7336-2a9516fb30bmr25300665ad.29.1770384216751;
        Fri, 06 Feb 2026 05:23:36 -0800 (PST)
X-Received: by 2002:a17:903:244a:b0:295:c2e7:7199 with SMTP id d9443c01a7336-2a9516fb30bmr25300415ad.29.1770384216215;
        Fri, 06 Feb 2026 05:23:36 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a9521f3b6asm24313205ad.77.2026.02.06.05.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 05:23:35 -0800 (PST)
Date: Fri, 6 Feb 2026 18:53:28 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/4] soc: qcom: ice: Add OPP-based clock scaling
 support for ICE
Message-ID: <aYXrUM+Wuso+aHGc@hu-arakshit-hyd.qualcomm.com>
References: <20260128-enable-ufs-ice-clock-scaling-v4-0-260141e8fce6@oss.qualcomm.com>
 <20260128-enable-ufs-ice-clock-scaling-v4-2-260141e8fce6@oss.qualcomm.com>
 <20260128-daft-seriema-of-promotion-c50eb5@quoll>
 <aYBE/VljJTUNx3LK@hu-arakshit-hyd.qualcomm.com>
 <b556cc32-2b8e-4451-b333-aec2eddee7b1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b556cc32-2b8e-4451-b333-aec2eddee7b1@kernel.org>
X-Authority-Analysis: v=2.4 cv=BbzVE7t2 c=1 sm=1 tr=0 ts=6985eb59 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=utnUQDMwVCZhAfiAu78A:9 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: WjLL-GZb28Sp45s_s8QHvCrgcUbyLilP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA5NSBTYWx0ZWRfXyZeUSkWYYNyn
 Qmj5QktfhXdk+XFGZu5rNsNuZ/mX7wp9lfcp+jZBIlFohVuUNFO+Q/eKfiLSLJeliqam/bFic77
 jekmjfISwsx1Na58LTh5LqwMElUN6Xsc0AfkKLPZtxW82Guw5Gl8CrwlDdqvSfLxuBxMcCK2/a/
 zOukcDD+Jw6paU4h9G2Wkvk1ORLTihCXqLRc8FsO4JTTmvXts8THVMD1KeLmVt/89D8pHTRKSPd
 BKDSUxzk/XTdqzkrFkotBKvD1q422RPagr9YvhjuURSz97XEleEVJO8r1NsjZ/XHUyKrr0ZQ3ix
 vXVMjVoVVL7+MaO09eiwC/2g18052o9dXiukTGahxu5Cb50XBiAw70dePpvHlYqIT7qqCNMfAu9
 qfgeThIYBUADme89aFE00G6TTUzx4TN9DFipORG4nAJmyrQYHJRNClkvq4Z8Y0cC69nvP0f3QYa
 PBKKc3yio2tFo843gUw==
X-Proofpoint-ORIG-GUID: WjLL-GZb28Sp45s_s8QHvCrgcUbyLilP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_04,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060095
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92039-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.978];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D128BFE173
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 12:26:25PM +0100, Krzysztof Kozlowski wrote:
> On 02/02/2026 07:32, Abhinaba Rakshit wrote:
> > On Wed, Jan 28, 2026 at 12:04:26PM +0100, Krzysztof Kozlowski wrote:
> >> On Wed, Jan 28, 2026 at 02:16:41PM +0530, Abhinaba Rakshit wrote:
> >>>  	struct qcom_ice *engine;
> >>> +	struct dev_pm_opp *opp;
> >>> +	int err;
> >>> +	unsigned long rate;
> >>>  
> >>>  	if (!qcom_scm_is_available())
> >>>  		return ERR_PTR(-EPROBE_DEFER);
> >>> @@ -584,6 +651,46 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
> >>>  	if (IS_ERR(engine->core_clk))
> >>>  		return ERR_CAST(engine->core_clk);
> >>>  
> >>> +	/* Register the OPP table only when ICE is described as a standalone
> >>
> >> This is not netdev...
> > 
> > Okay, if I understand it correct, its not conventional to use of_device_is_compatible
> > outside netdev subsystem. Will update as mentioned below.
> 
> No, please read entire coding style, although the comment was about
> comment style.

Sure, will ensure to use the correct comment styles.

Abhinaba Rakshit

