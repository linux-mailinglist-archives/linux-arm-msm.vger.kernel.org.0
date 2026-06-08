Return-Path: <linux-arm-msm+bounces-111934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yBqJL5oDJ2p2pwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 20:02:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0D96597EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 20:02:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NSWRzWv5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GHQofpty;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111934-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111934-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12FB13421C66
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 17:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD2DA3D47CF;
	Mon,  8 Jun 2026 17:13:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887A033CEB0
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 17:13:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780938802; cv=none; b=rWONX5WiuKzinGT8+D2CsNMRKrQqx5DREMghXmtdKWn05073YMUH96uX8j3uzpqSiOoY7TV6EfWeMMsAPHcCmr3zzqEZvQXTuEu1LtN2efRuCnAAfPxFr0grUnhBEU+TlmyL7SVQoukO14UsBEs47VomZj9ThrUrOpB1KXAJiVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780938802; c=relaxed/simple;
	bh=w9UPeMCzmKP4cwJBV6uY79TkRH4e1LLUkbhEgEb565E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PT7zZ7iF7vVe6rGhmxfeD/Y44Bc2fcy/F9gEV+9eQPXSSxn2ipubKUEkwvK5P1KzsDeMlmFNo/hHVb092Yso4lS+I+AMiLp5yp3jg+cIPRg5tA6uHqLm1/J0rluBhSnT317q3kxZCctkWg9g+LmIccJi1gCLeKUDAKssYGQPNAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NSWRzWv5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GHQofpty; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFSsg3596137
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 17:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6sR6VFzoNr94h9hx4YsrKB9qsr3ZjM5UBWPXF5PAwIA=; b=NSWRzWv5MxkOuENJ
	7GKDq9ZjFYsprTHdOqaLNkJbaMXBgAhHhPhqGpSS+O0sNG9ZP0WJ/nuSZcz5/ylH
	ESd4k6edwWVfwwm0FBxN5fWHy+/RgtshG25YDpIhdQh+hPMArieiazVTZGyXW+Rw
	AIgq86A80JMyfc9cKpLgM7z+WHipIw3Y+SsXuY9Rq17HkqO/ULK09GdIq5mnYrJg
	H3rSZbA4sYuBkU/sDL7v3keb5hDa1HScKcpqzJh3IbDEZa/LFyTRs25xoPvtm4JT
	aNkWg63HwXwEinCY+H93FbsC3dXL0mamqziz7eGSY6ZFs2BU319ImmEizQe3tAyX
	0b120w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4envaj9saw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 17:13:20 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85a2cde332so2304457a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 10:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780938800; x=1781543600; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6sR6VFzoNr94h9hx4YsrKB9qsr3ZjM5UBWPXF5PAwIA=;
        b=GHQofptyCT3r3QI2knkXrJXJkyyFWSr3NJi3o7Is7OHt6I8KwRgqphiK7LHsbjvUlz
         RIUNM7kNRGJovOzbZgGvvXnl5URSltisawSqoGSx4fz3AJaiJtfcZBd2bYjGxPr+krNr
         lwh05Hbf+WOMWtO8IW2u5sNQPINuSbD19EootQiGb8KL0Y2IJKqMdpUwirUisv5RQaUG
         Tad6BYY6nu5VQtRjkUZGqbJ4ych84amOrBq/ww4KX9n0ebEEdzznWPzUVjN9m6UZZOck
         culKzlr1jLgj8W0eTyPOTX+Pg5+QupJcfp5EQEAoYvK3R4NwJX6+FO8WMU40kx46fhb3
         zigA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780938800; x=1781543600;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6sR6VFzoNr94h9hx4YsrKB9qsr3ZjM5UBWPXF5PAwIA=;
        b=UJGkk7YROsGaaMkHGXZu8xFbxNHhq/ZT09cUukV1ID8k2q+U1qiVP2PziBFeIu9gzb
         SQibD5HxPDYQJNwPn8h1uruO3Tuj1yL+lGm9+Dy0330/r/+dwiT3N3zQdl9CUn9IYbfL
         sIY4/lJAM0paJfRK3hy3v/GHNth4ZGn1asctLzID2MjW9Pza4vu2ignzflqADoPLcRjT
         bwO+FHH6c0cVPOyYQsM8m3bX1MlS9ePvIPHJmOEIJE1Qjp+Y61l644ySeZzPFkCpec2F
         POcOT3lMRO4YJBgjm+EM+pTes9JFt3wmqwy7/xmjMqWd6AAc34WCoNO/TR0s/LzQGwh4
         NTdA==
X-Forwarded-Encrypted: i=1; AFNElJ9rS9cnnDW2QBrK4rYUDZUXS+HjgPEZTURAmQogC0FDEEgpmaI2WqreD4evS5xqNTyTD7cM0mIcCdfJ5UaQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyjaZiDxmW2aFJYibe3KTvg7A8LneHL8xDucSmVB12u0QM2WjrZ
	A1FeIDrMV6CQqKEgNKNBAHM+RdCRW0b2bm47SKsB1KKdlOjp0316qyUxZWv6YMGatlGRzA4sbU2
	/0N9bDbPZVV/recikWznX/i7bfooUllcU5oBC5f3pQ5Npbjo1AH1+TnttBd1UyO6NKUcj
X-Gm-Gg: Acq92OFcMJrB8+LUHyYJWEMv+nMqkhdeTc50MIe6JUtWzcYFQLNeBuMMzyfevuxDO5n
	/Jnh6XdOFIn8LnzVu0etRBr/QyC1UW6VAbed/A1ZLjXj78e4ep19ZwoW1+tuS7SuJ16MFAnlJVY
	vGG3sBZUupZ7zZC5CmHNf8jKE3UR/Z0YzsNk6Aj9cTlnqth9ANmdYbjKsVvqCbTWr6Jhrl7IVEZ
	pOEKWKiTkq1bZ+3diCKFfVc8aZ7/oNJCK4aqYkpIyONPAy3yL7pB/XIncVOyk1SSrfpQp8hmSAz
	1OzEHr4N8ulzcovrxkoUirCPIjvXU54AJX5p3rNd49ZtPCr77Py7+2KV444cqeab1BqK6SKjZ/2
	GaKa0pHOIP+FaUwdMSraZepRXnC8FWmMDhzZZJs14X23EhdiRVgWnV6N2acU=
X-Received: by 2002:a05:6a00:2d85:b0:842:74e3:48a5 with SMTP id d2e1a72fcca58-842b0f8febamr16529193b3a.16.1780938800162;
        Mon, 08 Jun 2026 10:13:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d85:b0:842:74e3:48a5 with SMTP id d2e1a72fcca58-842b0f8febamr16529154b3a.16.1780938799688;
        Mon, 08 Jun 2026 10:13:19 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.26.61])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828daf76sm19056739b3a.42.2026.06.08.10.13.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 10:13:19 -0700 (PDT)
Message-ID: <13855a40-0159-4fe7-a886-a8d18c081e12@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 22:43:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] clk: qcom: smd-rpm: Add missing RF_CLK1/RF_CLK2
 clocks support on Agatti
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com>
 <20260608-shikra-gcc-rpmcc-clks-v5-3-94cefe092ee3@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-gcc-rpmcc-clks-v5-3-94cefe092ee3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HBmhjRiukR34Y-dS_hPwtOpD9s4tsBvf
X-Authority-Analysis: v=2.4 cv=eo3vCIpX c=1 sm=1 tr=0 ts=6a26f830 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fk8PawD9j+7+MWV0iRjLZQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=-eDLaE2-C-4KfPfq9Y8A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: HBmhjRiukR34Y-dS_hPwtOpD9s4tsBvf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE2MyBTYWx0ZWRfX6iP+fdys+5lB
 Fg8Kyt1i7LiK3xfFDHAJ7jwU1ndHrm/HB7lH9SxQdAfD6Y21klSo7Bm03iJ/10crpeV8eYJ2cY1
 sz5fN7mC+ffuVqkkFCnIEe8mgPeZY4LX96gCsiqfZ1wSv6QIncDNX2FJyzRZseSNs4Gc7JrbeVq
 xkz+X3Wxu+3QLvX+QTYUugpRsRXjgG4N6U5TsO/J2X8RHu7iLn5pcJjNeNiDakc13g959OZiEbt
 MtiUkzunuQhV4+N2VD63Jj2b86qWgLEcKUGArfIf2MLwuY4hCPHcCgxgrocx+0YZ5J1hEJ/1Bm6
 ifqDS4ilwJgl4Ys4CMJrSYgcxsuZjWWXXDc7jGzL+ypNenqn0aGvlWRPvNK1R1jm/+/gWtER9HN
 IOPioCFX4MEOyks+7ZSdUX/b7Zm90tXlgQLkPPYccKZtZr9d2F+EsCf7mQ4lF/UPEJ5Iyxnw4Pp
 CaI1G5wdRA1gdakYSBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080163
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111934-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,baylibre.com,gmail.com,redhat.com];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1F0D96597EF



On 6/8/2026 5:51 PM, Imran Shaik wrote:
>  
> +DEFINE_CLK_SMD_RPM_XO_BUFFER_PREFIX(38m4_, rf_clk2, 5, 38400000);
>  DEFINE_CLK_SMD_RPM_XO_BUFFER_PREFIX(38m4_, rf_clk3, 6, 38400000);
>  
>  DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(cxo_d0, 1, 19200000);
> @@ -1262,6 +1263,10 @@ static struct clk_smd_rpm *qcm2290_clks[] = {
>  	[RPM_SMD_QDSS_A_CLK] = &clk_smd_rpm_branch_qdss_a_clk,
>  	[RPM_SMD_LN_BB_CLK2] = &clk_smd_rpm_ln_bb_clk2,
>  	[RPM_SMD_LN_BB_CLK2_A] = &clk_smd_rpm_ln_bb_clk2_a,
> +	[RPM_SMD_RF_CLK1] = &clk_smd_rpm_rf_clk1,
> +	[RPM_SMD_RF_CLK1_A] = &clk_smd_rpm_rf_clk1_a,
> +	[RPM_SMD_RF_CLK2] = &clk_smd_rpm_38m4_rf_clk2,
> +	[RPM_SMD_RF_CLK2_A] = &clk_smd_rpm_38m4_rf_clk2_a,
>  	[RPM_SMD_RF_CLK3] = &clk_smd_rpm_38m4_rf_clk3,

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


