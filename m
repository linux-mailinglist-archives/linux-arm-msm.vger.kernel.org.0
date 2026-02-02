Return-Path: <linux-arm-msm+bounces-91562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBZPG78KgWkCDwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 21:36:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D84D1237
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 21:36:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E37CC301079C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 20:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD3D02C1788;
	Mon,  2 Feb 2026 20:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WvGbhDif";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bz/SleT/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B47B2F0C6A
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 20:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770064560; cv=none; b=rYRRbOz90o9qeSSTj7ldu6ORgs7JRjissd1ZZSf0QZIAVpaWluKA+kccoLwlbVYQ6bNodcWk6KvfsJuO+YyetFtsGVK4R/7X32pZrjSBQDSqOMvMQKQNP3y3qiNs3aAXgsA54N+DTsnLw3vcCgxariJK+hnrjfx7hJ4cZaL8FnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770064560; c=relaxed/simple;
	bh=H5UIDfvZDYPWcYHdhQVeTv8EiaFtcIq6QkVj/IuBjFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GJmhVQeYZlgVKH/WeKakEaKIR7AtD6OI8rQn4QCo07/3xhuFBWLsJPQBzoOjkInXkbFuerSE1bPGd1Rp26C8dddxAqeJC8c9DICQ2eU2DurJ7PRQ+TCCPsnqciW6thwLISvPXwiJlV9EmbXy7y7cN+PvN+X4mIv4AtiF6Ocp41k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WvGbhDif; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bz/SleT/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612JD7CT2261991
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 20:35:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=slwaR0wTtsDqaLIEA5TT99Ty
	E26IITdacHcAuzrsvRM=; b=WvGbhDifuDma9Y8uRCIOTD/M2/UXWD+nzHL8zNKL
	fi/hxMdejOd3PUf15miIT9koYUAmnWU6lP5Fj/u9f0qlHIpPrQAmCxl6QIXLmmje
	VORBI48XHOrYrgxvv43XtCNPpAOHxamPbjXgEfJOJR5t27r8bLrNiyki84kj3GK5
	LxJJWRY/Orx2wHccv319cRp/twiU+R6a8h7tucGWfER75GKhcaONHYD/PvjypwrT
	mQ4zCP9zEh961BeRwIh/r/nq+T870s+m5JUP6yrfSwX4bpzQHyvg1HWZoP8Prn4I
	ucfcbrsb8NxaueACDOEJ/HsRe602xHWel1BSNGtDNUktIw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tmthqhg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 20:35:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70fadd9a3so1750491085a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 12:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770064556; x=1770669356; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=slwaR0wTtsDqaLIEA5TT99TyE26IITdacHcAuzrsvRM=;
        b=bz/SleT/laJnwXP7HYNi2XuLDxyv92kmE2ZBgKLSVJeN8ZJG3H88gZoT2qFYTpwzRW
         B6JvEaxairBC3ExcmeFMmiXZO8/jp/qwIN1XOKDEc22J9Vk88qNgYI6a06BI7SAp86d0
         /WcITCdfJgbOsNM73eQB2+dkzKXeq1LVnZF+ymaUitc2//si5wD2T3OyBbSud0a1/aCe
         qKUtZTmKk6LytPS5qcQbDcxD/7HS3Pll/nirMD/g+MzBOFdw80Tzqq4DhdrMb2n0MlkI
         ukxyHldMJuwOyVrcTJqd9bvpyY7sXV8Zi+zYsgbsAve7G5zh98knyUxVsSf7bQduSC1J
         /vPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770064556; x=1770669356;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=slwaR0wTtsDqaLIEA5TT99TyE26IITdacHcAuzrsvRM=;
        b=hWu7AvuVvwqvL1ZkCcaErGno7n9D5dx0Tev4ofKn/BTMj6p8L1j1Lkyw1Ky7+yxQc/
         t9h+rd6g9jDGHLjH25EUW42BBfKY4DUgL5K8AAN2VsW5cjIkcAUWTkqik9np9S5lgEG9
         FZ44sA9jB4uj1zQ3v60k3yrxAorAJcuBxuAgqesIF/Vk6qIOZHubg3L4D/Tg42V2pPBY
         AVtF50BQTBBRG51SFU7GJhsdtGikg3QRrcOWAp7ZS5QeqEJx5XJlciNpjkLjwim8Vyxo
         vEZdClCxP9oKbsbZ7gw/oJ0VAtqKA+3zH9cifwVdAVErCTqWLQdPLR6T7cR6aLyQTwGV
         Y90g==
X-Forwarded-Encrypted: i=1; AJvYcCVhwOngoY8w43Pvl6H94sAc+L0aqTTvNW6e5nt5E1E3FYCAlIca1FCBoumBRZ5RHov6bM308eu2QF6dm6P5@vger.kernel.org
X-Gm-Message-State: AOJu0YwO4VN+D6sFf5fxWYT4MnG/8bz3DYUAv2kYUgunOUUNvkCEbjHp
	HKEaakId6VkqWeJCts4zi31X8+mW66H1CutV2zGPfImE0b9n4yVGkJFaZKjo+Fi5QSUiFtjsInx
	lFdlzLWz9rfCC36Xhmjvv2DpEkAB04LMboq+oNnNJdJkJzjexML/4UiQvhR0+68lTHPi9
X-Gm-Gg: AZuq6aINytqppqLQs1ifKDVyYoJDWx/oAz//R+PykT9dJCol3+xtpds156JMf1QSEiY
	9YHzvcaq7GaXupzDVoNVIHr7hL0h/hlXPuTTpSmxHdGe6mRs0vNDIJFX8noo5U9bFp03P1hbtkQ
	RZvbt6aaqJuofuJWIKZXVLnsJkmyi5F5ZedwecV1Ke0uqMqSH4P5qyVIaq821By5PaVvZsGim5g
	ARKVziqK0/fgTO9yfjur2aeOrTGOJBMSG8F1oCfzbLnHZ9CkuCDiSnMzzrg2uPooAd5LPJGdi2c
	q6PJgckDyCUBxDxiMgVVqenJ8BwC6fj2pTOuxcR7bIHhrErcWnfWOztVFzU7o4KMG6DjTHzshV0
	W/h+luFLCIdHoxqLezhsIdRNMoBgY3FbqbXqXq4rMUpkrH9UmkBmr+2A9Y8GC6DdhBBfYQFe3ye
	M9k01Vvfj83B8ZFZZdhSapQuw=
X-Received: by 2002:a05:620a:3941:b0:8c7:768:430c with SMTP id af79cd13be357-8c9eb301a21mr1801974685a.68.1770064556404;
        Mon, 02 Feb 2026 12:35:56 -0800 (PST)
X-Received: by 2002:a05:620a:3941:b0:8c7:768:430c with SMTP id af79cd13be357-8c9eb301a21mr1801971585a.68.1770064556009;
        Mon, 02 Feb 2026 12:35:56 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625c8dfbcsm32799151fa.22.2026.02.02.12.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 12:35:55 -0800 (PST)
Date: Mon, 2 Feb 2026 22:35:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] clk: qcom: gcc-glymur: Add video axi clock resets
 for glymur
Message-ID: <j2orj4ugtgqkt32snnrejtonopt6h5lwu4yiaqocxq6v5r65wu@kifajuvaudsh>
References: <20260202-glymur_videocc-v2-0-8f7d8b4d8edd@oss.qualcomm.com>
 <20260202-glymur_videocc-v2-3-8f7d8b4d8edd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202-glymur_videocc-v2-3-8f7d8b4d8edd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Xb6EDY55 c=1 sm=1 tr=0 ts=69810aad cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-zE5Bsz_LXmV53O_SacA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: EABCMPAAa8vsAA-f8pAiZV3rKKdeauyr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDE2MSBTYWx0ZWRfXysuwExMtnsdj
 6s6F6X5Dr0IyYEV1/US4iCuUnKaJZWV1SVwdJkeYLHFuAjQPcUzJt2D+7JWLF2QC5RuIO4YCcRp
 37CtgSxI1PV2n2DzQmQJgM/aD9BfW38I/tkXtXPhRssKC+VCGn+VQEVLqL5mGKxf5Icurd44ESs
 sKQT3TPtncGrXIYGyoccIwXRRMMrPFZEJnPBSgkMBpoDnVkWCfGqLHDCmMenNQLC5JQxA4NiZNQ
 BYBy9BT685O7kQEAAkODr+eXyvInGG5cQdJcMlCYUFQvJT85oc01PuSGRds1cEjlLy3U0eWR9NP
 fAm+M9iurm5v9LuKkkfzyo6RKNjZNP+zxMIGLNZ5PGEEpbfXvKEiDKa90Sqy8sFWKpoBbHXdNVx
 mvRPFn/vijWbIEE8e0I/PH3aRwPlQ2MSMxSAmCe2LuRezbvaFdUTu3+FoKxkBsUfZM1qwAKgxkI
 XDqO2uV/4B13mV4zfbQ==
X-Proofpoint-GUID: EABCMPAAa8vsAA-f8pAiZV3rKKdeauyr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020161
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-91562-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 10D84D1237
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 04:26:52PM +0530, Taniya Das wrote:
> The global clock controller video axi reset clocks are required by
> the video SW driver to assert and deassert the clock resets during
> their power down sequence. Hence add these clock resets.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-glymur.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

