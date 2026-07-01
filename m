Return-Path: <linux-arm-msm+bounces-115710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PEvjLSQWRWr86goAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 15:29:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 491896EE1D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 15:29:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="PT6eI/e5";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Hm1/60bm";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115710-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115710-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 14A9430938D9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 13:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A287481FB4;
	Wed,  1 Jul 2026 13:22:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5C0480DC4
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 13:22:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782912127; cv=none; b=qh7rxFY+/d5WNB6Nl9cVC+nAOZGccAsh7hkxuEzFPLEQpkHpLNs79EkB2ca8xwRFI88Hs2L6bT/M67s5OEdLT4XcMuje+8CIq0mzvgBqP6iwKIZgHOKe9OsEvRN4wrPYt0R06CoEnXnCJKrtb7Grsy8VoGCimFtO2QqMwhATeIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782912127; c=relaxed/simple;
	bh=imUYo300ApW9+d4uFzn0MvuMBA15s6GsjOB9vKaypgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UMfOaKlnf74YgOCczuclVJuK5NvJZnS112C5CNAfMm6ipAOW+cd13ouuaVgTgQW8HtFsDM5hgSEvPiA3LtOqQWCo3iqyw+/yzL4kVURjiGftLuS0SMVObApZZwgtLjvOzh4gwxUHSPu3sAK45gKcmgHegz9jFAr+eWg3QpENOSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PT6eI/e5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hm1/60bm; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A93n5753728
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 13:22:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	323+8Lo9ghlx0OGQxYVl+sZMRdS8gaUESvkTn31utjQ=; b=PT6eI/e5XC3Vp+2L
	u72/5Hg9ONZgRtEGOgS2NqthBrvy+0pT8hADKp49sRvtfvoc+G69iQHTMEhyhBEt
	ZLjXkMqLDjURVp2PfLKH09eNBt8SneTzD6uWVkFH3n8sdZp3H8V3OQorqgIi1X1H
	Ur0MfOjpN5ZPjgTMmbb5xFe/gwvPk6gPmLWE0JM5eU1R1nz8kfW2+gznY7BE2GFL
	tjcbVWk/4pCGcKjVfklbTMPNxpdICaEk1STSzx3Ivd6xRf8SE6oRrrlbkjTjxmL2
	4bpxjKr2/dFF8KQZ8XpW8QqGIB5taBFFhNO6Mvz3Xczr3u31FYA3lSXDSpFLxDqn
	ImNjPA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4rsy2xde-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 13:22:03 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7392d893428so30008137.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 06:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782912123; x=1783516923; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=323+8Lo9ghlx0OGQxYVl+sZMRdS8gaUESvkTn31utjQ=;
        b=Hm1/60bmq4wQfX1QHE6HC7YtdigXG/0gTxJPO7idh4v7dc7PgLBGIil9IQ/BQxhf/d
         jhrMLQz6g7ce6oNITR7vU+DwEK6RBiejmvN2XpcTuc674VTLIz84zFR4OlD8o4JE3mwP
         y7WKK/myZZRvfL/11iRGtmnhIslEh97Gt0mGzfDVnyvK2Am3Ym3ljTJs2lFPcuCxb4nR
         DrKKBYEfFGqI4hoddtQJ9gr4SQWbv7O+yre1Yry3uCRqGm40H6QgCKuN9+mN58csAAHy
         Kk5+3ndYjRmaHMQsWuVjZbTwya44Jy0D2IoZcT5UumFNL1QGJvUcVohZNFkKemfx2NtD
         +EHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782912123; x=1783516923;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=323+8Lo9ghlx0OGQxYVl+sZMRdS8gaUESvkTn31utjQ=;
        b=maFP+dMko3swkVqoR+1wMKV0zQ8oHQtrejY+2rVnq3jce5xQDqenO7ixEmOVa4fOal
         j9vRnvzbWQaemAam0xWeYbDrTiEoRjZ8uE8bMuBuN4utBWGl2LS5gWA33MjMZThJivtn
         2W+WGb90CTEtmVjlmKy53Qdz8ayjN01C5JXqM71mi4ingtwq1IDAdKbOLely5DYQhX4/
         jLHn2OZSeF/4/uOuKQJRC1iT86GmgwaEl5oD7vVOuHoYndHpPyCKHIDJZGXe1EofHDGb
         k8XtWXd8DhSi+e2bDY38Z64Bx0Gbwm5NWoT3XIZZZbQfW8m1H9xpfwITwtkcmodvk1NU
         3qLg==
X-Forwarded-Encrypted: i=1; AHgh+Rrdy3yv2h2d1mVxcrZph1bMVZzuP1Awmz3hKYWPcxHf+iECa9TTtPWl2wjrgTT9QA8Pjyo51IGcGNHfacg1@vger.kernel.org
X-Gm-Message-State: AOJu0YxFkDcfJypQ+OSNieR3tWYaqhSzlxrgIlpay7b/YC6hVyWy8tby
	Nv2kk1nus55w5g3u7ourVZ24RuSx26EoX5zA24EhMT4TxvQtuNpRzgESlELAzLkdQSTpuICbF1l
	3/irz06V78cx88GpO6nbHHF7jGRXyS8HtM9VoOMT8QznCaSUcVPNj0WRAtyL53Fb5OMmMAM24ZT
	Zp
X-Gm-Gg: AfdE7ckVuud0TAX4zbeheAcEUTE6OhNXUWFEC9iAEWfoDeySWMlR7+EpmStIFZ26lly
	cRfZJzyd4DMBVXah0exLjtXEmfxPG0C/ItFI9Iy5gKMOd47B/Hd/zjOKT8hSxn+mhF0+6gtr9BF
	iaBPFrRJMA3aLb+bQeSNYTKn39cGiwAEvGyIAnoTQhUFPBYxdXO4hAtMUHDIi/iH/zoHGb7kGAO
	BQvGj9nDokR2Z59vJk8f7FvT/KHp7f0qvlq7ueoAOKABkkXrot/RrtR8wfCi3iX74P4gtYYl+VN
	CDMn2SKnkEiQ2xFkMw5jpntVmsPIQ+wXRt0v2noFpC+Ed7WAt+vFeC54bTpQAa8OOjguHeyg2zb
	9vzV04RfghZZghPQKlT6oJ4YpjQakO6vKvUM=
X-Received: by 2002:a05:6102:4415:b0:729:5cd5:8cc4 with SMTP id ada2fe7eead31-73da9af5eeamr199515137.4.1782912123393;
        Wed, 01 Jul 2026 06:22:03 -0700 (PDT)
X-Received: by 2002:a05:6102:4415:b0:729:5cd5:8cc4 with SMTP id ada2fe7eead31-73da9af5eeamr199495137.4.1782912122983;
        Wed, 01 Jul 2026 06:22:02 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288dbf4b4sm274203066b.28.2026.07.01.06.22.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 06:22:02 -0700 (PDT)
Message-ID: <e232f53c-e610-4c73-b1f4-2015f50569fc@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 15:21:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] clk: qcom: negcc-nord: keep GPU2 CFG clock enabled
 via critical CBCR
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260623-nords_mm_v1-v1-0-860c84539804@oss.qualcomm.com>
 <20260623-nords_mm_v1-v1-2-860c84539804@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623-nords_mm_v1-v1-2-860c84539804@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XmZrHp9-bDfyRARQNsMEJ06-NeBTKWgp
X-Authority-Analysis: v=2.4 cv=fLgJG5ae c=1 sm=1 tr=0 ts=6a45147b cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=hEmD_o_XFUzyhzP6z_0A:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDEzOCBTYWx0ZWRfX6SDikR7TT95M
 UsfmGZOhz5ns+KGbhrm89o8SVTDNNRXnMIzGTx9PSNiof71ro9Nnf9VAojwwDJNlTMCHuhcJfGK
 BDq9BpIzFjl2USjcPwQb9nH43FDt9q3TKeKGRkG1EH3pAVt1H9tF1kmoxHBBprhmZv0+Y+RdIRe
 S24EafyJs0B6dlJbXdzjGAdWZlrIvBzK2d01wibpsIUExuc5Z9LpVSMAKVGnTlCwZuX7YprfWvR
 uJfBzE+52hfFZMZXxGrGdRT7t4UjmpH6V16Un5Z2usRWBhE0HuvPcH3dSGsjkdNBZ+hKeQ7p6U1
 9LgdxmvzluKO2ESyAFLXsDyybXvbuGWwwvjayHlpR24yWcvyPdSCpwdya1ZGP4Kz4C0I+GeDRsc
 FC28vyMRIAxZP/NsCvuazo0F2q97ShAXL6Ev0o71p6cBZG0qSE0tsMMPbbwTNEBbFIEbrJalF7e
 4Qgfk/OBz4NKh0DrK2g==
X-Proofpoint-ORIG-GUID: XmZrHp9-bDfyRARQNsMEJ06-NeBTKWgp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDEzOCBTYWx0ZWRfXxp67kK4Jma9b
 IWkOJ+I/3WJpDuV0Oq+Wzf476zjjrwA5Y1sxWt/ZeIK29kJuv5/+HHHqcvzBODnnzEEA+RLRnZu
 1Osqpv7Bl1UIE+JGy92PGCqPyl++2JA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010138
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115710-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:taniya.das@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:shengchao.guo@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 491896EE1D7

On 6/23/26 12:54 PM, Taniya Das wrote:
> The GPU2 CFG clock must remain enabled for correct operation and
> should not be exposed as a controllable clk_branch.
> 
> Remove the clk_branch and mark its CBCR as critical instead to
> prevent unintended gating. This follows the same approach as
> 'nw_gcc_gpu_cfg_ahb_clk' and aligns with other always-on clocks in
> Qualcomm CC drivers.
> 
> Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

