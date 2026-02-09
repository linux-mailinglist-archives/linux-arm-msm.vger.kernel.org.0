Return-Path: <linux-arm-msm+bounces-92286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EupAKrXiWlUCQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 13:48:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6DF10EFBC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 13:48:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9441130182A9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 12:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B0A220F2D;
	Mon,  9 Feb 2026 12:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g9jNFCZA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y7YN5DJu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C092116F6
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 12:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770641178; cv=none; b=VbK+eGdncl5dxrnXZjef0a7QXqyL2rn4UQTZ73C9lSjK/sieYxU6vIzCsHBHB8vDrBMqz+VAYGJbrOnFQDf7gJtTEGscGKay5gp3EowYKc44tMrapXDrKe6ojf82wPDDIgPnKFV5I6k77Xm7m0rJZcvsEpTy6I964oU4D/009J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770641178; c=relaxed/simple;
	bh=OacN36NWFIV0LdRew7Vofda8ShXszySLFuA0/phT6XU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WEKe1920Ix+0d9o9Se85cYtfgtyLQNdXgyEnAfTtKEwOfjXp2skaZpJXR30pIyLq3eyYuSDqOvCFNrteIu+Dm77wqWqE8q3i24lYxu0Ur6kJix580ZB1Sl/XOec8nmkTIA47dWldW6nfF1aMSY3ZuYjSJrkF2KARZH9EBRSaCbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g9jNFCZA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y7YN5DJu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619BoSnZ3252267
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 12:46:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ntkupio6zcUD3ZHPYQlWxMbSJITTn30CMZLbiUVXeDw=; b=g9jNFCZAhREb6/bG
	PbaXB0QBoDAavm2sCLSzwq+SIeY2KcUcqiIRwCyVQR8nCuJga1nTvFgiy5zSRm3K
	9Sbc4H9BHSLPfnIVo7xepNHD6ELBZJubqYoqqmu0aZRnIBWoULDeo7jXY29ity1L
	yS37z4DqjJvTm7jFgbHGU3VDop6fsV2q15WxahFEWErIWntDF5/loHiRlZ6aa5Hk
	GI7TAAFbpitEBvC3jAfd9vYWiZQ8gQRnGrHBUd6EJfW2vvallaXDJK6j33iOAUMt
	GOvc7q2rGwO5vf9pPnFE3/NYQmg9vPVxFE6F9ghVz4NzwxuZdsIDsayqRxJJjMuY
	Ux1k2A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c79f69eqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 12:46:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6ad709d8fso1034410385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 04:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770641176; x=1771245976; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ntkupio6zcUD3ZHPYQlWxMbSJITTn30CMZLbiUVXeDw=;
        b=Y7YN5DJuO708rPg0Ftj3YJ3ql8NTNtgBlsbyA+NIj131mX81pVxIOm8j06MxTAORTJ
         /5/x31a9zNIOVq873vFMuGMeqobxcdGALA2BF0T6KdFpPkB2Uw5StMNcuKi+DN+5jzey
         1e5KekZ1KYW6c4QbYSzwBmWggr6gq9Ls6RWJXuOI2XZzK5yFEcTmZrY8U31xo+s0j7G6
         mAQKN9SHz9yqhheD7ykibJ9jdPv3ZYuS87msMOFjf/8BGVCpkEgXOxljn8vEZFSGZZ18
         /etr7zLQ12Uaw2VKtyU7Ru5JNot3mG20R1i3P4izqkp95GNtCGj2aJJxPGeEyJxTLpi5
         8Yeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770641176; x=1771245976;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ntkupio6zcUD3ZHPYQlWxMbSJITTn30CMZLbiUVXeDw=;
        b=tzQHRAsL2W3MBtYSU81D1BIR2nzsAGVj3Aq5NHRaNRyJLlfxm5KVzHodSheovY3CyR
         vm+Fk72qwQ0uJJddAXsu3+OMZ0y8qimDwf4rLOsxhpL7F4AEvEraUC0Sy0ElaCpB9zwu
         anIdGvCtyk9WIjL+VJR/2MkTMzcPRMPpwQ3Wr4Ihk2ilviqKpc/gDo2BQ80rTn38+y3m
         BtfYu1o1RdJeEwYwat3o4J7fbngd1Y7/Lh+VQQfZTKtKqGWUN3mLvRMq/ZqWjzeyETOb
         Y5RZXTTrDds/ixzRq82SPIJ+nMCkDhYr9njZa9cLo3J8Os8IKZXyBa/F8DQEzEJYEZoc
         s8SA==
X-Forwarded-Encrypted: i=1; AJvYcCWKEx8VKyH/KWh+k60B++TPzjGor0ZyGqBFAf50I0z8PdbJPtJi9mtVnsQtuMS38Kq5RhNMQL5EQj/JZKzZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/9qQArtGNZJMLZzB2ibh9wPI/ukEPQTQ4L2rHVFGp5cL6reWu
	elLo0Q3KADFlpE5MOU8sgerj34DqEx2fjqbgsCgVT636cVLyq+j67cHLmHQtRSg5tbCpn9llEv1
	fQ7I8xwSox13375RtnCQEvtqOtolhcKFlYlGa8eHzq4Hj1CrfC3+c1PKPCyE6kTMwAqKC
X-Gm-Gg: AZuq6aL+5NWPnLp1WJmHMm9OLfKG+++8SESdeqfikm0mcXgc3ToReaONZo3BVGJvK1j
	/ECWLtOCMOQpSY3UO9D0GhMpJs6LbEhyqbR4sqONzEnr7Vu810+o2QpYmVIuTOUystlP6qGumsU
	9L1J5cmOqW64s2mxsyzfdwhoM6DPt3hB7QYXIIuJfc+uajRgvScefkQUlwyLsgOF0wlUfk4yWDA
	iV9O2tFI8PcZ8+tA4awv6NHVEjL/nbsmPr42AmxTqxY23HXRU2HNqTKNQ8YzFr5EMH7saPDRUJm
	mAFkvsWpVur/k+O3e7FHZcNoxqLJLFP2W3jUjgxFxyAicG91YU+ZJ54TwpfFh8qQ7ypPShugCvv
	zDNNGNUYx7yng9jDl+yDc0J+N/lq8J/T6TSYYieaQqEqoxoT3kkJhbahrEiFJg1VkIM8NVtfELB
	6MgSMMCzHN4btGGTMJO47PtkU=
X-Received: by 2002:a05:620a:44c7:b0:8c5:32a0:3421 with SMTP id af79cd13be357-8ca40b908bemr1976891685a.16.1770641176570;
        Mon, 09 Feb 2026 04:46:16 -0800 (PST)
X-Received: by 2002:a05:620a:44c7:b0:8c5:32a0:3421 with SMTP id af79cd13be357-8ca40b908bemr1976888685a.16.1770641176112;
        Mon, 09 Feb 2026 04:46:16 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-386b63b041dsm25669091fa.24.2026.02.09.04.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 04:46:15 -0800 (PST)
Date: Mon, 9 Feb 2026 14:46:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] phy: qcom: edp: Correct and clean up eDP/DP combo
 PHY configuration values
Message-ID: <36ourp7swd36ptbal2gd7byrppownihbpkkxvocd44u7zddc4f@igo5h4yhbxs4>
References: <20260205-edp_phy-v1-0-231882bbf3f1@oss.qualcomm.com>
 <20260205-edp_phy-v1-1-231882bbf3f1@oss.qualcomm.com>
 <1b78ea12-84ba-467e-b541-1ffd2348f38c@oss.qualcomm.com>
 <92556aa2-607f-4743-a480-19458836fffa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <92556aa2-607f-4743-a480-19458836fffa@oss.qualcomm.com>
X-Proofpoint-GUID: cJVBuGN4k8_kURpguxp_0UQ7djfHofnn
X-Proofpoint-ORIG-GUID: cJVBuGN4k8_kURpguxp_0UQ7djfHofnn
X-Authority-Analysis: v=2.4 cv=W581lBWk c=1 sm=1 tr=0 ts=6989d719 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=jmIFWC6BSrKBpW1Fwx4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDEwNiBTYWx0ZWRfXwipK65HBsPm5
 3Agq+e53IoxqyoR5WMMvT2pgh9tAxjYiAbnE1hP09TfecSLxTqIbH8XWXtFbJ7WKdRwKD4IHp+d
 D54ZXPTOTXPoFIWZOOm6b38RlQJjjtep9rpoQEqnpUpo6vGiKC/eVcZzIRTYpbcNAME3i1RNnOi
 K5vW0syGlnkig6jBLEbOs++PoGuQFpAEPN0ClV8zKKraPQBEV/TTmlZ+psh/yVlOqpYjM6gcWQ0
 sZQJHsPfUbE8zhEvg0Z1y70s8/3kGheSdZhP3JNykaBNQJA3YS92CeYLvgh3/PuCVg6hAZRFiMo
 n7wft+9LBkblVcp1xJ102umdT3BreKjVNVYDu155EuB6pkk//VUOguPD/DCY9wTi8BeiiZFN3KE
 59buv3lHAARTqGjoEbC0Uq99fmfX7so0145GJMVHewCTKXEof66mlV7nhMLVdlCZEcXG9qzyOz9
 4siGz+AfaAyJy2GoetA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090106
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92286-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6B6DF10EFBC
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 05:00:03PM +0800, Yongxing Mou wrote:
> 
> 
> On 2/6/2026 6:47 PM, Konrad Dybcio wrote:
> > On 2/5/26 10:20 AM, Yongxing Mou wrote:
> > > According to the current HPG settings, most eDP/DP combo PHYs can reuse the
> > > same configuration values.
> > 
> > Even across the various process nodes?
> > 
> Emm,Currently, I have only checked the five platforms that already have eDP
> PHY driver support enabled. The results are the same as stated in the commit
> message: in DP mode and in eDP low‑vdiff mode, there are four platforms that
> can reuse the same settings. The HPG I used was the one I found on IPCAT.
> Regarding HRG, please move to next comment.
> > > DP mode：
> > > 	-sa8775p/sc7280/sc8280xp/x1e80100
> > > 	-glymur
> > > eDP mode(low vdiff):
> > > 	-glymur/sa8775p/sc8280xp/x1e80100
> > > 	-sc7280
> > > The current driver still keeps multiple versions of these tables and
> > > doesn't fully support every combo PHY mode. This patch removes the
> > > redundant configs and keeps only the sets we actually use, matching the
> > > platforms listed above.
> > 
> > I see that e.g. eDP Low-Vdiff swing setting for RBR is:
> > 
> Hi, do you mean emphasis settings, i don't see 0x11	0x12 in arr[0][1].
> > 		hamoa	kodiak
> > arr[0][1]	0x11	0x12
> > 
> > It may be that this changed later during tuning but it's not reflected
> > in the docs for kodiak
> Emm, if that, where can i get the correct value for tables.. In this patch,
> I’m indeed quite curious why the values before the modification differ from
> those in the HPG. I’m not sure about the reason. The HPG I used was taken
> directly from the current go/ipcat. Could you tell me where I can obtain the
> final table that should be used?

Use the HPG which matches the chip generation / codename.

-- 
With best wishes
Dmitry

