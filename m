Return-Path: <linux-arm-msm+bounces-96589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCHgJ93vr2nkdAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:18:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B728249406
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:18:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9CD73080F84
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 10:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B2A43783AB;
	Tue, 10 Mar 2026 10:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lw4syb/8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WkCWzZu8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E99136F40E
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773137873; cv=none; b=FYCLDO6UM11wvMoJjsKLf58XMtdqEK1+dY7S17lVC0bmahp1XL38KudCHildxKdkwrAz1PBzveC1GIaOZxxQscrCKblxdPMu8FRgswAqGUcFFjq/a9qg/mGLyZALd74gOcSkcXBWD0l6iR+JrtqICt59Z3UFwt6Xmdr9YwjXPX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773137873; c=relaxed/simple;
	bh=mI5qIBVFMwGLLkKGKbAonBY/LKZ2Y4xMOrsGBPOVztE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UOgBl2nB0wSrxGDM+GOXUJmnkK0sK/koVpyw9l0p112PA3IzzcAOFvssRNfQ9oO4nAAPxorUjqbTduHeJ2Vl+mN5C665fhXYP5di0SgAFn0p5b4A40zCrC6UAhEIhzfh9cDvCDxljLcFaSoSls8EC5IEl9VU/kxGY+NhDjGoL74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lw4syb/8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WkCWzZu8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A90RpP3587447
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:17:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e2JZBk2Rfa3rw8LMthiOXRzB5EWHK12Fq64DmUEVAXE=; b=lw4syb/8R3TUcI1S
	j1yESAfadG50WntxIQ+fF02pQd/eRZNIIIsU5eZqYk7PpExTXU9Qppc34MYOpeIv
	ymTkRrxg/Ngo00n0SjJMbvaDl4F0I62Idv3sIIpAvGjt7kh81NZDWSZxHEZQcCtC
	QtPFCe+RFNuSLRBpxWhUfppJxs8nPAy3cKKsHdAEdyUC1gdSHDbu2csu8eIvbzZq
	/xdVdlfp1wiavoVruyASlBP8jSjNeDsMxYEThk6ga8UhkaeuniOAPUfKTWWv5r9k
	deJ6+8jPaog2+xw7/7MqRbxtKsKg/PUBAnfFrip+YyI4isAyIs3hJVhFsO3Epp2R
	xQBtGQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct1ekubun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 10:17:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd8198fe16so172509485a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 03:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773137869; x=1773742669; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e2JZBk2Rfa3rw8LMthiOXRzB5EWHK12Fq64DmUEVAXE=;
        b=WkCWzZu8DVbzpchgmXwUGqMsLQ1WqMGINM/V5KC6LQAxTZCa+OxvwZfqYjwfQ0eNtJ
         gqv66Dx7tRt9J6CpI2CGrdFkLKzRSCOKS6ZyTa4BK/VRGsnvhKICChOu8oWfW6an0Nlu
         tCGejDsS40015hjMLeatMZL3DfQETuawojIpOx0NhYtVGzsd8anZAz/4acjuBrqY0ydH
         BMRPhrG4xfpO54JO0O5Nd1LOYaDXD7eNhYzERFih8oVPXqS6D2eDAqZ9uqOdwYwevZDQ
         b6WDBG46f4jr2FoyFd+z/blo5IBI/aj7Mi0I7i14z5lpzBlRZwbjppkb2bzA9AAM4Nsz
         DGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773137869; x=1773742669;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e2JZBk2Rfa3rw8LMthiOXRzB5EWHK12Fq64DmUEVAXE=;
        b=uqAz9kaKImkF8kwcIIdT5WPePFvfgrFhdoRuuoW3GRJVaFPN1G51I/+K72KagM5OtM
         ecUbWVsichg8j0FdOUAQvZH8QGfa/W45bVSGtIS7tgQY/km6PqoaQNa9PB/D2L04JMGM
         2C5+7PSKXj6r2W3Ehgc2Rd9LaEVaG/2bFVfT2lQNOZ07VYUyqwE2MIiC4abR8V2aJ/wn
         ZtUsmmNfPkq7wkf2044HW253Z32NG1csZarPpkAKp07bVjz/QvAH7mNlxnQP0qZZhfew
         PMcMXbWNAzZ0+wm7iRETHL4GTrapyvOMKCTQV+aCjUbc5fy1QjRGI7iXc25+Z7ba0fbh
         os+g==
X-Forwarded-Encrypted: i=1; AJvYcCVfdbV5uegQkrxxdfciix8vubreAORBavo3JEtIWN5xnY2yh1ygBLhYpN2slDMVgS6HI5kTTLcrQ5D7ZJLn@vger.kernel.org
X-Gm-Message-State: AOJu0YxCtsQogGZFEqJasjIAo240Abe5qxIx4kIu8PDDB5H9rosD4rVj
	bgj7kOIFR9Dz/hiJmGCf0EDZnwLGhL6+UZAQbY7M7aGHtP/Vvn0VJMt/G5yCo95B/0Swt1E6IQ0
	WMHV4c7EL2UXz83fTM0KbsG6eknOp2dyadlqMYTeF+p6e18/BfHxXgoY+zvwBGts+7KCl
X-Gm-Gg: ATEYQzzAqMIWBlvnbElMKpO4YyWxK2iwrpU0UK6FouhY/pUivmBLzKYGOzZSIKty5qL
	ww3l2TRBtgFp9EMDmvJKnkaP4gZaAKaj90+coKFmqGWBFZoXe34Gsi56tZqRxzc9X1vhnoqyx8J
	JxY+1fpZ/1sB7IUOtEkFQTPAON8nC3xSt3BwONffWTzADa+x/lBbCXgYKnsNaPsoQhwNPzM72Hm
	OYcSwkTqYnw47QeDDBmP8rBe2Qf6CBbwZgqQosoeCW6lFeWioBRaJmvmg0o6HIXy2YDk99DbW4j
	MhrR3L8cjsE+KNWtMkwnUCEwl5nVWSgnTohZNn+1M0yKIuivon1vua1LiezHAJpflXhOsHkZEuK
	2+UzgR6xSQayD/GgHMuxBI0uwqUSc7dmyPYzuI65c+3151iLHparUEqYLL/+zy9TiX1uOfSkPJG
	GneoE=
X-Received: by 2002:a05:620a:2d97:b0:8cd:78b6:e26a with SMTP id af79cd13be357-8cd78b6e9b1mr688659485a.2.1773137869464;
        Tue, 10 Mar 2026 03:17:49 -0700 (PDT)
X-Received: by 2002:a05:620a:2d97:b0:8cd:78b6:e26a with SMTP id af79cd13be357-8cd78b6e9b1mr688657785a.2.1773137869054;
        Tue, 10 Mar 2026 03:17:49 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6629311736asm1329813a12.24.2026.03.10.03.17.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 03:17:48 -0700 (PDT)
Message-ID: <92127112-9d7e-4fc3-ac04-4ec0206d8bd0@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 11:17:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/12] clk: qcom: smd-rpm: drop determine_rate op and
 use CLK_ROUNDING_NOOP flag
To: Brian Masney <bmasney@redhat.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
 <20260309-clk-det-rate-fw-managed-v2-10-c48ef5a3100a@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260309-clk-det-rate-fw-managed-v2-10-c48ef5a3100a@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JFk6a4Qbhh1Cgrlt4Pm-nSaPhgydXzku
X-Proofpoint-ORIG-GUID: JFk6a4Qbhh1Cgrlt4Pm-nSaPhgydXzku
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA4OCBTYWx0ZWRfXwJhoiiNKWk3l
 EKlZSUhloXtyeGS4PDNdgQnvs2XCRVYkUjL1ST8rHmMkNAR58Bqr/KFybHy/SNPNYQGErxL2De7
 lEJwS9j+2fjPUD+CYyFVp9SF+0ZdHMt7MlzqQZvYB/XZXs88ridkeGggJM0wh3LUUckSOoU+VxX
 BugOaUjRQMBghA9rNBiBxNEBqQnw+n1U0804VZjMCSWCKTH6KKpls+5tXhPafdNIe/9zZfZ/uVf
 /cD4qSe7P1ap4vuTCVzZDOkyhZ6CzaRlct2E/MTgCR0aRoZd+REsZ/Ppxa9Tx5GQlC7GAkZVCmF
 bkDFHs6deo20oUk8ZXcGkj8VQjs5cg7uTO4sVHFC45nGVOXHwlTeasLtowMc9RWLxPYTPakhhdI
 yRMT0V6baK37xIicqWWfxwQeP61zbmZau0L6sBxDh4iTOXppLVU0nCHzaDwv5TaWeh6UBD93uVJ
 ssYdtWQ9OEQegIbEZfg==
X-Authority-Analysis: v=2.4 cv=eIEeTXp1 c=1 sm=1 tr=0 ts=69afefce cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=VwQbUJbxAAAA:8 a=IpJZQVW2AAAA:8
 a=rLhnAkHiV9PJIhVTlEIA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100088
X-Rspamd-Queue-Id: 1B728249406
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,baylibre.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96589-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/9/26 3:38 PM, Brian Masney wrote:
> This clk driver has a noop determine_rate clk op. Drop this empty
> function, and enable the CLK_ROUNDING_NOOP flag.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
> To: Bjorn Andersson <andersson@kernel.org>
> To: Michael Turquette <mturquette@baylibre.com>
> To: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/clk/qcom/clk-smd-rpm.c | 15 ++-------------
>  1 file changed, 2 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
> index 103db984a40b950bd33fba668a292be46af6326e..8c6fc5adf5f50537a4f8d43872bf2f9065e5d6d4 100644
> --- a/drivers/clk/qcom/clk-smd-rpm.c
> +++ b/drivers/clk/qcom/clk-smd-rpm.c
> @@ -35,6 +35,7 @@
>  					.name = "xo_board",		      \
>  			},						      \
>  			.num_parents = 1,				      \
> +			.flags = CLK_ROUNDING_NOOP,		      \
>  		},							      \
>  	};								      \
>  	static struct clk_smd_rpm clk_smd_rpm_##_prefix##_active = {	      \
> @@ -52,7 +53,7 @@
>  					.name = "xo_board",		      \
>  			},						      \
>  			.num_parents = 1,				      \
> -			.flags = (ao_flags),				      \
> +			.flags = (CLK_ROUNDING_NOOP | (ao_flags)),	      \
>  		},							      \

The other two definitions (using clk_smd_rpm_branch_ops) also need this

Konrad

