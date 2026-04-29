Return-Path: <linux-arm-msm+bounces-105189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCd6GhTo8WlZlAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 13:14:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1C4493635
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 13:14:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E23C303C005
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C27353F0749;
	Wed, 29 Apr 2026 11:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L4ci4D7b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M5ZRz5vS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FDB38F65A
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 11:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777461247; cv=none; b=eN0dq/3ytUX7hZxDQeobiVyGd9VU8oCQPBBx1HswIfKyVIg4ald3C1h5F866HrTL5w/CYxGF8am0MAqalQKCpNBMaL3YIR+3r4TJDIVSt8och9uvkYjl+Tmo3hmPAkZfh6Av1XDuZXQFa1HH6rL3sHRdaMll/C8ov5QibSbe2I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777461247; c=relaxed/simple;
	bh=NwdKNv9Hu+IWNEVQY+p5RpQP4NJdLi/dq8xnqnYaRwQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VojH+d9uRyUPHgBY5rZnCaDlhcZ5vfaI9BSBg8GQTMabGlIXkjti1YlxGRyl3CNOcPX/2VcmMpZ5x/tRG46yW7AXBO7N2hd6+GtVqZRzF6UjbcpUj3EVisBvOCeDG6pHxBnhovoBblZEelbflxQJxIn7Ud6l2eE/odcKCiokKNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L4ci4D7b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M5ZRz5vS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8prwq1728581
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 11:14:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j992D0crgViSah9SzynZETMed764JJO3ToIXrer4z6w=; b=L4ci4D7b7m9Y0Lvd
	OU5xI4yGxG/tQDYOuW0NfXMpXASZf4an0LV8mRIkadB9P+TOzZVFMQlhRWmBEqPw
	YUz9AOFe0Kde4xtFhJewM26paqu6gOy+ixNU6jRpv9yPlxKtexrnkpTmdrNKuoRM
	kyc70AJeIqdpx5w0Xy26kt5Dk4/QnUU0GeKHqMXcqLx2PeJ1QsAoNpFMni9asUPI
	sECI7bfDWssTt50K6ohMoY0t+po/ivuA+DBDynvjgjWHcqKqeb36UNqwmhNJnZhm
	88SW8ZjsoUIwxETWSlio4GWy3BxsJTydMh7Is4Ju+PXPinn+NOWfyE2/3Ujk7as2
	AtxefA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4due5krr4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 11:14:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-362eb03240bso5642579a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 04:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777461244; x=1778066044; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j992D0crgViSah9SzynZETMed764JJO3ToIXrer4z6w=;
        b=M5ZRz5vSxR//HSfcvO1iCIWg72UNeSjClyaCGHhwZkDHGploemhrZPD1HzrpgPEibQ
         owimUM0gWRRaxWizjdFRL441dhyJr6EDSL32YmVtFJD0PWH0A+ePaEWzmPQKNn5Q/Ilm
         jJmwmZuxJHTkavqcQ8tYhfXcFTWk/caFmXSIlpW8h6S3gFpWuzLJxb5QVqysSiU3WqA2
         f0t6ZmiVkAnL9B7ubkRCYhyUdjqqlJuhmPs94kMySI+lGzdYNJ7duAFuV70k9kQYnKuT
         1ajN8PCbNkoWAjD6xI7mxCTLFO5FZgPEsPeWrrGOzJNY/3Y9yUrs3uIq3A1JxcobpvF2
         kfqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777461244; x=1778066044;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j992D0crgViSah9SzynZETMed764JJO3ToIXrer4z6w=;
        b=F2gJp8u9EvD4UMN7yVrMfYq+x1BPB/8sgCqbajcvFI79c0QX9YAZbnYan+kEis7mo2
         xiL97ojjfiYEMJLslPuMLfbVRXp0Q0t7YUNbUtCjwjuFKSnrNfN6+15D94GJ8xRSNg/z
         D51xYjPZjNsQRBlQii3SPW+xfQAWjf2Wwa3wZf9kfK2sVokrfUh/Yi7j5ANjYPHHPVB4
         IFyywmu44A6iyrKtWfTRFdacoMv0/4j8fwpaXJxHQnSjK1NyQ7qyY4sKCDq0OiAJFNX5
         Ai2lvfZju78qp1mBRFLxO9TiwpqjehUqW1CQXsRwJRaSvv86N5ZjIUmf2pi0e4lkWZ9h
         2dgQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ljj4nP9agMAYc+usuL8XGIDfewfA9KmH/ZPGKjaXLMZ1Teku0zXPJHKLQsrjP1GbbiN/L69i843qamwVu@vger.kernel.org
X-Gm-Message-State: AOJu0YziYjmLubly1YFuxCVmd5lCiK3KLPTWg3twJ3kavDskPkbVlrox
	6oN9UPfGmcyZUL90O/CHkyOPSJx/YLJ7c8IWSd2oJzKyZhdPpjd6Pa1WjR3wzR/FBQHHjY76MMd
	Ay4eAd7OFX27jbDr5vvs6ySbmnVtA5TljDpJ+lwUmT+HewEHeKnayx1F8PG0QvhBcqvwife6MIA
	zA
X-Gm-Gg: AeBDievpT6tWgUMJrZ6LWPF2sTUzZr+TvtolZ5q+idYXRJdXg6uR9EV2DxEfxEWXv8U
	vRfhg7p9zL5eTmhh0v8UrJt/CQf0cdRoOLrcHaAN+LKUwyLZQFKDiUQS9E5kwJjmHj9bEeTdFQ4
	u9i0vXa9nE5jW439E++gEMZxEyhRIJ0fkjMN+Rj1RZH9MPDU/hs4zprNQt7zcKWZK3EmBtlPf0I
	0oOj9Km7leJxVcS6TAmBXwJtysR56pwyUpIfY7WGH3bVhhl9WlESL0fXX3zqjE5vrZgJgS9c4Ds
	caqsMGOUGqpQIqo0e8ug6JEt6IkhLMTr9NKx4qaKaqhjkWCa7IA4LCA+Spm6lMdBMf+T+j0CzCI
	oEtwqyBKLasBFPVROk/HT/DbUENDaqn+qHs/LBZD2gpdELoJDvfJh+6xhQR8v
X-Received: by 2002:a05:6a21:6da7:b0:39f:2b9e:e489 with SMTP id adf61e73a8af0-3a39c05b9femr8322395637.13.1777461243982;
        Wed, 29 Apr 2026 04:14:03 -0700 (PDT)
X-Received: by 2002:a05:6a21:6da7:b0:39f:2b9e:e489 with SMTP id adf61e73a8af0-3a39c05b9femr8322361637.13.1777461243538;
        Wed, 29 Apr 2026 04:14:03 -0700 (PDT)
Received: from [10.217.216.225] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd6067403sm1735002a12.10.2026.04.29.04.13.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 04:14:03 -0700 (PDT)
Message-ID: <be36fe69-e7e4-41c1-9dc7-dc2c3d9af563@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 16:43:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] clk: qcom: smd-rpm: Add support for RPM clocks on
 Qualcomm Shikra SoC
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260429-shikra-gcc-rpmcc-clks-v1-0-c3cd77558b7a@oss.qualcomm.com>
 <20260429-shikra-gcc-rpmcc-clks-v1-3-c3cd77558b7a@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260429-shikra-gcc-rpmcc-clks-v1-3-c3cd77558b7a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDExMyBTYWx0ZWRfX5ChsAl2fSQ59
 eEIvhNlnLH0CuAnl3s7xLZxuIAGcqR0gAu2RgGi3H1HNAEg48FzE3md82xH+MncbT/XZomE/k9E
 mNX3WW6o2CFNTkL1e42SzxFeNTAFhmQcskvj3pCyMCXohVx7ojZTW1sHSa+roDqrC39lZAxZpIE
 16hD/+C78f+HwlDMxg9O0i6zrXOi5yXzuAsXuIxcqRYlswCBdN5kUYtjuM4ITyLVBKfntDbkPvG
 QwH549zf3VASp3kMYKmn7XOHPstjziabJIx8U+aACS17wK+l6Tg0ayVA4IvfSKTLUBcTkChtWyd
 P2rrA8vCXnEBwuSOR83ktVWEcuF5OyUONLZ2ZTXaXZi1/sLSABrrr3Cj9gd8RZi3hxUoKT5okB3
 vN6SfYrYEazmGCisRb4yU3BxLJ1ouWGqeUn3DXsHg2FiOeO6yTy8qQPNncQs0iWmPwS0uM3izYJ
 ekOWpMqEu8gMxhwFpog==
X-Proofpoint-GUID: 2079BnhXci-ZHXoa8gZmtkZd34OwzayS
X-Proofpoint-ORIG-GUID: 2079BnhXci-ZHXoa8gZmtkZd34OwzayS
X-Authority-Analysis: v=2.4 cv=CL4amxrD c=1 sm=1 tr=0 ts=69f1e7fd cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=G-4fGFNKO6kq0i09DNwA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290113
X-Rspamd-Queue-Id: BD1C4493635
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105189-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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



On 4/29/2026 4:21 PM, Imran Shaik wrote:
> Add support for RPM-managed clocks on Qualcomm Shikra SoC. The icc_clks
> list is same as QCM2290, hence reuse the same for Shikra.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-smd-rpm.c | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


