Return-Path: <linux-arm-msm+bounces-107054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKDfAsbqAmpKygEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 10:54:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7061C51D14F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 10:54:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C44D63060F36
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 08:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB8A73976B8;
	Tue, 12 May 2026 08:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f8+gyyVu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c3Muf5U3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57918396D09
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 08:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778575962; cv=none; b=T0ZqoFcyNBHOkeniFMPk8rCJM4zDSwqgutIml7UMO1C9YrEOmE1QrlTDp8/7H/f/9NFFZoA+40zO5/xJzzjNK0B/26JYftSUJ4ASnM60IX5ZTuTlT2M6cjcEtjYsGvVK4PumhaHy6FGsdv7yOA6QCQMiuyMTIMINwetFhNuQxOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778575962; c=relaxed/simple;
	bh=aQmHLV3KCZ+nX07DoRiDb63BwVeOxt0UBUkcs+cdYXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cyIzLP0VGhMfwyQZUmZbzLUFzPMnZl+mrSPG093J7hthrAJXFyHDLwgPNIkMNS5wX7eHJPre/U1t1Lyd6EwqsHsBM/NcnCfXWmEx62KmzFejGtZ6d7FCLNyYaGWetY8l5+qOQJFZRgEKuDF5zZNgtKJTUO43ROAb/98WP6nkj5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f8+gyyVu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c3Muf5U3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C6CMD93882174
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 08:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	53+Ajxm9/zLBxHnAxbEtkpFewtO5WL8IWPxCOpSgNLs=; b=f8+gyyVut5AKopKd
	mSeXPq9Nj3PlBCRZf7BuZy45g7tkwBcu/Rq6OQys8VzEF6OFTqbVtKIcVhLgxW9P
	eukcMCqtmgcuwSEts7+PvyJ8uXDBzzPYvA663cDrguDJ4EJ+lJW3XHRoF3NuE6cq
	fR8BiSXabb8G1rqPKdV7vYN9MsXzv3FdipovBoj2BBnrFYHrBDNUf05y8pBpQLmR
	42DuQ1iwcSxDchhp7pDxWYqaNBb7t1UJTZ4f1oMmS/2BkbabNIkUhSaCDJBZSbb5
	q3Fky4FA9DfuySLnEjo3qd6zxuCKjMXFTD6AmB509wRhvkr69uKLIbXovteDkg0T
	y4opew==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv2aasj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 08:52:25 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c81086bf930so3774150a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 01:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778575945; x=1779180745; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=53+Ajxm9/zLBxHnAxbEtkpFewtO5WL8IWPxCOpSgNLs=;
        b=c3Muf5U3v40ymkBYg/rqO87R/MFL3ioA+mK0t8Up2RQyDE0TQRAaWnIJa2eX77zVcB
         pI+tumLTCKzgXHGeSFP89umLJ5Y38GE96cwGfpNZnoHJ49q1jGh/R0Q9klQ6XpzXL89O
         JG0UE2XXPRPGoz/7IzgwbG+vF591ldYVg2H3K22PFLIlcLqdTweYZeeogKdITtiBPH/c
         saWOMa2whVjqaJ46OssluopOyd2ZhYfnjK1ftgDZC9Pqkts+wEaowFzaR6I4CAyuGbil
         2f8f0eEyQ59bezS72aavw+Izo5w2bID0PAKtb6U1+V3ic9P/okVAnXxzVIqNt7RLC1Dv
         XfvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778575945; x=1779180745;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=53+Ajxm9/zLBxHnAxbEtkpFewtO5WL8IWPxCOpSgNLs=;
        b=Bxym3p0FEXUDQybwQMIgB9eFhJkxdDe6t/wRgZg6+SkKxB55mRN/2f3jpCkxoMnkGn
         ErDmZZtMFxgpsCSfTJ9YNn7Amp+H684BEi3EGTzqEf/YLVbq45hK8VOzjEGA4GwRUAI3
         gSUJOe120nbfkFV8TQkPCSKgKYjzWn3Utx1pO2KVyHO0n/S4lw2OzVderipJ2JIvFuOx
         K65TAtaJ444u+MNqptBSGF3rkbGp8y/PGdc3cDMSVa+VwOzA7KpeTFyb9QD8Ji3op/Iz
         WCfdktmSj0wv/m+1fmkWxtYNNtOoMLYOPQXBGe5vk92wW4FqyTjag1di+tOakoGNKTtT
         +7eQ==
X-Forwarded-Encrypted: i=1; AFNElJ8CZJ0XpTspwiZP+Cmpb3G5K8fKvnW4L5QjU7zsBeuzlalgLBKSXuweD8qqau+Bh5+NWvm0Oq85oLhltvoW@vger.kernel.org
X-Gm-Message-State: AOJu0YysOc6Rmk8ARL5rU1Z0GinAxobealj0w9z2anW2hxmB/V0T6svB
	MQ8Z//XoTOkBTuff1R4k2f0y0K+LhslxZmJPdTbbZdvOwlm37w/oZLCT8jyLra9RJXvgiBHgBya
	zIG8qW4JadUDbhPCbbHoh+GQCEI+CbYL0fleLWWEC+tn6Jdi3IBQDKlUwjdw2rG2HNA9g
X-Gm-Gg: Acq92OH/9EhrYBoFspsZyxZEC7HkWxVmVA5pC89v1MQrl4WQR7PDbRGzZfiIbBwDXXn
	wu+IBCKEUlnXZL4S0im2/8rZxVQrWVCbgtnvvNCXjJ3QXFMr3eBFXk/Ac6XoRAYDHR4rhhjtJnQ
	8O9WoSBO3yKAzTmrP9hcYtm1kkdqnXOl7v0L1PTnOVSMulfse7m1kfOgxeAuQFCTWLDWJBExzI4
	v0UlpKHHqLDL+mOdzE9b3+E1rovMYPT9BQQzfLrEEzT4V36YTfECGMJlKjcChrlP+Ekz5ZnrX9f
	EZFJUxmti29IMkY5b7tuakRhxyvnO4jiy6YrIEPSTNqqPa51DwWi522I2hIdns+IhATkDm3+0JB
	h2C/WSaigNVltH2CvVZPbj5QCJR431n7+RK5rsz+SrFjcRhAD
X-Received: by 2002:a05:6a20:258f:b0:3a3:21db:8ecb with SMTP id adf61e73a8af0-3acd4280430mr3012139637.14.1778575945180;
        Tue, 12 May 2026 01:52:25 -0700 (PDT)
X-Received: by 2002:a05:6a20:258f:b0:3a3:21db:8ecb with SMTP id adf61e73a8af0-3acd4280430mr3012121637.14.1778575944726;
        Tue, 12 May 2026 01:52:24 -0700 (PDT)
Received: from [10.217.217.99] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8267688e2esm11432629a12.8.2026.05.12.01.52.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 01:52:24 -0700 (PDT)
Message-ID: <f649f4a8-df16-4fed-b1ca-4362680252a4@oss.qualcomm.com>
Date: Tue, 12 May 2026 14:22:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
To: Bryan O'Donoghue <bod@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
 <20260409-eliza_mm_cc_v2-v2-8-bc0c6dd77bc5@oss.qualcomm.com>
 <cb5a40e8-e2e3-4ed9-a9c6-0daa9f408710@nxsw.ie>
 <Z8a4y73p6MgF8gQkVtottkgG2Ok8-Vhm8zzckWEbiU_DUO84x2VlwPt-VBL2g0utw3ZwZK0aUvI4ev-p_YRGoQ==@protonmail.internalid>
 <328b388c-438e-4f91-9384-0dad903355a5@oss.qualcomm.com>
 <b280ad04-d4ae-4904-9e99-3d057e3d221b@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <b280ad04-d4ae-4904-9e99-3d057e3d221b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IsAutr/g c=1 sm=1 tr=0 ts=6a02ea49 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=UOnGL9-HqUUrvkLjBzwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: MLEI-2Eisvyc_uBYBq5YwlMsTt39HHWl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA4OSBTYWx0ZWRfXymYFtFvVi5Zb
 o5Bq6XQ/WmsygnovzL5l/XLgTFOTF947mVzV5z+RVrJL5OSR0oom1SZIWHv86Pvrlgcjlgq0+Le
 ciAi3zxFX1xbENicrS7TLt4lhiKuJbobaRY8bjb1HwKIK14NfilEKN4NSrbykda6KqKf9DIUlJa
 PdGgm7i7MgHvawW/4aDSHGGU7IROk5XXMXoLrUlObiFLOtN6il2tdnOLNWNGWf4al4bNRHhrXZg
 I+he8kZwgne2ysBrns86XZ2TaH30K4vb+xPuMmuTl4NGVfiWHHuKVtAor0qkuH45vpf1OMnfexw
 zx89X2cQUw9ryAQ5bhxEa7d6ndwIBCtcfq7s77x52VZ287NRRAEdT2+5mc4tSEdLBuaKJCo9hXI
 lc7SiNKCV5kMzvYgvkCw0CSK2lhcEDaGnbvI72G7dxAoYZtLw7hGJim8uN3tCLVqz/CHRI/ztWC
 Uxv6MPJafT4osNGSNOw==
X-Proofpoint-ORIG-GUID: MLEI-2Eisvyc_uBYBq5YwlMsTt39HHWl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120089
X-Rspamd-Queue-Id: 7061C51D14F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107054-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 4/10/2026 1:56 PM, Bryan O'Donoghue wrote:
> On 10/04/2026 04:55, Taniya Das wrote:
>>> Why do these two controllers have no power-domains ?
>> Bryan, on Eliza the videocc and camcc are connected on CX and MXA.
> 
> Shouldn't you at least have:
> 
> power-domains = <&rpmhpd RPMHPD_CX> ?
> 
> And even
> 
> power-domains = <&rpmhpd RPMHPD_MX>,
>                 <&rpmhpd RPMHPD_CX>;
> power-domain-names = "mx",
>                      "cx";
> 
> Konrad's suggestion to me was that MXA should have a vote in my CSIPHY
> series I think he and Jagadeesh discussed it but I'm not sure if they
> _concluded_ what was the right thing to do.
> 
> Right now I'm representing the dependency. MXA is always on ... and
> there's nothing to do voting for it @ MX ?
> 

The clock controller drivers only request the minimum operating level
for the power domains. Since the cx and mx rails are already at the
minimum operating level when APPS is active, explicit voting for these
power domains is not required from camcc.

-- 
Thanks,
Taniya Das


