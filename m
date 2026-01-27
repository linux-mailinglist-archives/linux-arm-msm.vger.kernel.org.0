Return-Path: <linux-arm-msm+bounces-90683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PILLtSHeGk/qwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 10:39:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBA591D8D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 10:39:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8084B301CDAD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 09:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EA762E11C7;
	Tue, 27 Jan 2026 09:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KUqhSAIA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ju8wnL8u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9F72E091E
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 09:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769506768; cv=none; b=tpejenr5Te3TbaGgyiy3yVfsFVrZr7RtgEF5yEWs5cE5otFT9PwUsNMwCBOtTHmliIe+6mkkDH7aRjOxLb/CHHAACWnDapWqIZ2P1gk/GetRdWDcfYAnckTX8AZPtXxujcDFY2jCL/aKNc0NONBapboHfuKV26eXQYYR2t2ThAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769506768; c=relaxed/simple;
	bh=I3s8D0ZU91T52VwzCxt8vLcmvK3I40yU4xTgHFtzys0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mPJES/N05drzIujoqNq9c9+FTpxRlkx2rdkYgIfDXUDZgQ4XkhJ0zIeLlpoKBDR8LQENvkZy1ZvbaorpRPHr84MpYEYnv8eVL/OzMQFELHeOAJ1Mzlo0EEn+bwrmzUm42cuDyXwjVsBxl6ea0dyHTjolSQAZVikU2r6Vtm1IEp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KUqhSAIA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ju8wnL8u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R86uOA621131
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 09:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lovvu2GU251dCX9r+xMYucJV
	cTWVctZ/NYUkFjYRq1M=; b=KUqhSAIAxUBNkToxY1XnlQNHTFgwlV3Pvk8UcxLO
	b/LckxauVRVfL1XUOiHjOkFHtdDeccCyxzvim8RQ1rhZdTFOuzn7wkJmcmvt7EZC
	kOwUmobdM2MrIf77igTUORceFzHj03VTour8eHselj20AzBgbBxcthqaCQpWoqiD
	tjD5xVnFKAyg05ZMP3ndzVW3zibJqnv0fzjR1/FQ9BN6K7Jm13XzX4xFaBwPakwT
	QyP9hpY7kbh95GR9oNWFsIUCPbSHmiDDTvIk/fbdh8KOI1J5+vb1XBqeTQKqNKFU
	4wczteMj78g7tan9SsbOMZkIA20INHzKf7ny8gEZ2S/cVg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxsjegahp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 09:39:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f1f69eec6so51987715ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 01:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769506764; x=1770111564; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lovvu2GU251dCX9r+xMYucJVcTWVctZ/NYUkFjYRq1M=;
        b=Ju8wnL8ugmM5S8TgTt0IhEh0Bg572TgZotM1R56piYlcCaq8GmtUnegnJS+TcUUK8b
         HP/7PFCoT6bi7PgpTyg40vyvJWdSlzr5iv3W47glUnhs3pPGE6RgwkpT1IFPhRc8EL2C
         I0rxkYMUlQIjQpkBREGJe8ysUQvdsdG6RsqNpm48ep/0hacikkuEYnxguZSGdRBhz3YQ
         p4cGHYaCLIA8+RqoQAWOMWivZko9tY4BAGP1QdiIdHrqhiuPeniFn/D5+59HfAVqPM9p
         oojKFNKtzfGqQGdgt2sJXixOH08tHcG5K9nKsnPX2IVSA/AwIYchXbBCJdOLMh8oY7i6
         b/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769506764; x=1770111564;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lovvu2GU251dCX9r+xMYucJVcTWVctZ/NYUkFjYRq1M=;
        b=Tr5zPFCwYr2waij5SpnG3Pu/mHEiUUcuWlpB6F4VwxvL1Y1siMVH3/pE2SyE1l4Wde
         5bi4+f/4xF/eHYrGys7WGWGCDpmuKQNEa+5U5/Ge4EXGDqZ1ermgXoiTwxpVw+bTyHTU
         lxwQYybG+ksz14lZx4sjLYqJ7PfxbMmQFf93mMLdoQz4R59/PIkZiMdrwlMM1AJGBww9
         iJTVe008+P3oEu5NFy0l0Qvd4F5K/dInb+a9A3wZB4pek//QVtFk+rZeQb/ljCvqxuXf
         GX0RgWInKn0ac3k9AAX31zbbXQkjB8LyLOnlcHEg5Ka4XloMlLWeuWWJchJnjM61r/yp
         bEzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnz61z5Stuu/1Vaa/JFYkoWLv2hYtAJ52TezX5aOsQIMOWvpW66IXert0Rf/YkbxAlua9bMWXC67dHYjW5@vger.kernel.org
X-Gm-Message-State: AOJu0YwUVa0ldshwRedBl7y3rErfQbYrUQ66SjAQQYVIbtTt0ML0m9EA
	asNNy3HswtejSGJqSURYs6fATrtHeC9ZkfDB/jwZJmanaaaExmLgMuCyX+hxTkbLgc7TAND4pmP
	0ni0Wz6X7bT0rMabSRvxEiglUzrm5Z4DXNw18fJ4EYtXZHQpkaqmaAWXByrVu4fAvE1I3
X-Gm-Gg: AZuq6aJXA5bCSrff9Y8Fi8LQWyNaKESe0ICqtjT/uERnFsKoxEJ9mZkWpt4JOmjfE3Z
	WAWQuOGG4iqT80oryiNV8CRH7r1ZR12SGWmmlPEBqHElDP97GT+9dSGjwa4FSZAdA6NqwWxERDN
	eT5tBI8YjxvTwwn/NgxcMWec5DNrgjsry/1ntF/3hCDJzbcA/YsUfvRk/dLZqZcQjV4gp3Pj0ii
	a37jUT/sNfHzvu642/WwcN+gaWRZRuk9IuYM+4CfRAOtHA+EoLBbmHhbUWe7fSUwVO/wtTOfLxz
	cixoo2MMRATulGzxO8lqpsOsNSh5dvMvk2+tf8fB4uzTmfT98N/MHsYRCJ0B/yM0L7JhudJQ1t0
	uR21wdajbbCm2C83XI8WOfafDzlRFnJXFhqGKssHzTQBk2g4=
X-Received: by 2002:a17:902:ce8c:b0:2a7:d5c0:c661 with SMTP id d9443c01a7336-2a870d4cc31mr11873955ad.15.1769506764233;
        Tue, 27 Jan 2026 01:39:24 -0800 (PST)
X-Received: by 2002:a17:902:ce8c:b0:2a7:d5c0:c661 with SMTP id d9443c01a7336-2a870d4cc31mr11873755ad.15.1769506763710;
        Tue, 27 Jan 2026 01:39:23 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802fae223sm112148625ad.77.2026.01.27.01.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 01:39:23 -0800 (PST)
Date: Tue, 27 Jan 2026 15:09:17 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: Re: [PATCH v3 1/3] soc: qcom: ice: Add OPP-based clock scaling
 support for ICE
Message-ID: <aXiHxepQdqT6IrKM@hu-arakshit-hyd.qualcomm.com>
References: <20260123-enable-ufs-ice-clock-scaling-v3-0-d0d8532abd98@oss.qualcomm.com>
 <20260123-enable-ufs-ice-clock-scaling-v3-1-d0d8532abd98@oss.qualcomm.com>
 <gfqpfzulzptkrbcrc2zcnqv6kmtdgwwxqc2rxnbq3rlh7azilj@srzlycd7wv4d>
 <cc89a22c-ec9d-4660-ae78-7d0323c99d4a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc89a22c-ec9d-4660-ae78-7d0323c99d4a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA3OCBTYWx0ZWRfX24Uivhjk48nk
 PPPyYkFaWvFF3sKpMtqxGijbrCeGLuaGcoXjrcdgqGHB0YHGzc1clbC8s0M32esvZMeglqrsUXT
 UQ10PjvQ0aK/33G3XM0E1vGrkKd0YdorMQjtRpiaC9/n8hfNGcETBajQ5ZTJXzxCAVjqe2pUc5Y
 pqqo/IQSAFiSS9527RLuydvZUd8dKoKpgqamxYEh4/jd961AkSBMCfbDPAhizJocLdHc+5e2ko4
 1BjSJMy7RIU393RxpzhNKwOoYzOHoAR6+ZLkgNj73U6GA3Eaeea9RyVWCJ6JXiicajO0bd1n3ac
 IZb7bLq85ZNA2Wb4GQWEog7Rhub9o/uD/DbyoYkm/xaN2amo0SR8f59my4kyShuHiNchOby0ADf
 5/Bw/7f9FSThzM11Ntc4Syye7ZJupNe2GrUR3c7C6etaAvMl8U7rIgJq/3XhzfkYoiNPRyWKy4K
 48Cwr2uLahBFH1FoQ5A==
X-Authority-Analysis: v=2.4 cv=Qelrf8bv c=1 sm=1 tr=0 ts=697887cd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8kCUroivCZrBtzWfW0sA:9
 a=CjuIK1q_8ugA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 5bhydQbXZBaJTUFdylvbHgg0LqeGcBNk
X-Proofpoint-GUID: 5bhydQbXZBaJTUFdylvbHgg0LqeGcBNk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270078
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,hu-arakshit-hyd.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90683-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2FBA591D8D
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 11:23:51AM +0100, Konrad Dybcio wrote:
> On 1/23/26 8:21 PM, Dmitry Baryshkov wrote:
> > On Fri, Jan 23, 2026 at 12:42:12PM +0530, Abhinaba Rakshit wrote:
> >> Register optional operation-points-v2 table for ICE device
> >> and aquire its minimum and maximum frequency during ICE
> >> device probe.
> >>
> >> Introduce clock scaling API qcom_ice_scale_clk which scale ICE
> >> core clock if valid (non-zero) frequencies are obtained from
> >> OPP-table. Disable clock scaling if OPP-table is not registered.
> >>
> >> When an ICE-device specific OPP table is available, use the PM OPP
> >> framework to manage frequency scaling and maintain proper power-domain
> >> constraints.
> >>
> >> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> >> ---
> 
> [...]
> 
> >> +int qcom_ice_scale_clk(struct qcom_ice *ice, bool scale_up)
> >> +{
> >> +	int ret = 0;
> >> +
> >> +	if (!ice->has_opp)
> >> +		return ret;
> >> +
> >> +	if (scale_up && ice->max_freq)
> >> +		ret = dev_pm_opp_set_rate(ice->dev, ice->max_freq);
> >> +	else if (!scale_up && ice->min_freq)
> >> +		ret = dev_pm_opp_set_rate(ice->dev, ice->min_freq);
> > 
> > Do we expect that there allways will be only two entries in the OPP?
> > If so, it should be a part of the bindings. If not, please design the
> > API with more flexibility in mind.
> 
> hamoa:
> 
> LOW_SVS: 100 MHz
> SVS: 201.5 MHz
> NOM: 403 MHz
> 

Understood, will update the patch-series with multiple-frequency
clock scaling support.

