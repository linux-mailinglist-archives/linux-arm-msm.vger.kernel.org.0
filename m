Return-Path: <linux-arm-msm+bounces-113369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YYe6HRolMWqlcgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:27:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E24768E416
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 12:27:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=O69xuHOT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fGVd0rK0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113369-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113369-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1636B3029704
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 10:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F7FF42883B;
	Tue, 16 Jun 2026 10:26:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D58324B31
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:26:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781605563; cv=none; b=k0E4lQ+PI7XIIPb3AxTrpJ06W9xD1mQfdzfrMytFjneJnr2ucmxWrErriRYm8W5K1n6fv4Lm/z1z+I0A3VSSWECpNa8u5/qrNW1GYHRQ8w1wzb0QA8Jx5k+6mhGWTYuiu23QPyEQ0guKTc+joDNjrCjn4fzXpMqvxwOciPNIGNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781605563; c=relaxed/simple;
	bh=rBQrkdlLxu+sHScrpiOHOcI8isRa+CD1qTLn1K7LBaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tDlEa3v7YzRN1XyblUe8+x2UTO0tRVnlVl+fh8sJDG9MY+ZOYYrjkE3pHJRsXJzGK/UnOig5nHXD/652DXWqZfsw6SKl/fghVPm/Uphm+vRESfDIx9btoXrc11koJDYqN3aJdqPURWMHXPlw0BZ7Rlt1sQfkEMWW9etHxwOnYt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O69xuHOT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fGVd0rK0; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GACWRl3474774
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:25:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7V7D596VKMgblFH1E6kjqVU3QLyINlDY8eH+KpidKYc=; b=O69xuHOTQ5mv4r2n
	LNZYoiBf88oVrj0g6nTrb330YMVO0hLNDsYgSW1DeDRixLjVs5tHFqb69pSBUO5P
	oFF+4ENAr7avI8h7CvI/UFQbFKxewyfhJKfhGLbvKfkqLvg0K87+PNNtArnkeMX9
	067u71zi6x8bBnqWNEfs4skrJuBJF1kwI1653P2UPMu5IzBF9xUcC+PBwRHFg41W
	6p64WwGDCieofF61hZ/P7RePwF0dazOELPt/3IX3uwnzE4RUPODUF5123+c73Id9
	Na5i3MEUHmG4otKAAVz95WrPgTGD4LtRnWWq+10ZHDG3MPQvVlVT+Ta2L3QAbOp5
	HNPdug==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ety52sgav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 10:25:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5175bf22b2bso6038031cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 03:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781605559; x=1782210359; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7V7D596VKMgblFH1E6kjqVU3QLyINlDY8eH+KpidKYc=;
        b=fGVd0rK0D+Liyww9SF3LNti9iaslXkdL0M0DyCwPjSmhr2qHZ3Z0V/lxFiOv7jq4W3
         FRU+zn6UF9krOrMb8KqgWTJKjn6PZQEyNRKt8dfhZT+7twRylXwgxQpt2LdZ3t9+ltwG
         +mxYBJXo98VA1iLAgT4Z255QTemfKQBKimxXjJtmT2KCjV1zX7hkBgS4IBpn/+wi/lef
         9AvIWFH0EmcPoS0Wrh9+ZlOp0X+BknqPfT421ydOvGmaWcW2JEYysLnOkaPimlQi2dfp
         e61qqAlbKLRO0SasDxPAxed7fbvkWEmVhMtIXyzVdlaGWyQaMf1IHVG8wnpfGghkI5os
         e+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781605559; x=1782210359;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7V7D596VKMgblFH1E6kjqVU3QLyINlDY8eH+KpidKYc=;
        b=eRAr9H4JH3qyXh5hpw/FnOHoZlzIZQUOAfDRCnun102Gdvh0tGYjT0JlRWDVem7yC+
         TtbBk5iiTVimQ7LKcKvxRQ9vU9FGo2kMive64+4zU9VMpP6GZfaCwiPyshbmrp27aaFV
         X2yZd99jiKThx3wdjfnmshL1DARBPaSQjK+9v1LKgqWH3CbJmOafp+4SWowXn7T1M6N4
         ao7/FREJ5IRjAXvbN4PtoK61pEaCJiTFJ/F/evxB+Q+uFFcF9oydOQd6MQuMoZPEa/0q
         iNawyO0EHoSeimMtGwe6oFkDRkGzqcrTjpoY0+VsKVNHfyJKbAuMVbArSak3DMr3a0Tz
         cBWg==
X-Forwarded-Encrypted: i=1; AFNElJ/2h9PgEuKbs77CdURcCvRGXvq5x2QxLPF7c7ufCPx6JwNHPwNhK1ODHDMDgUE5GM3WYam70s8cM+Najs/L@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5JuPo+riz4YxI2l/MPX9m1ddeYqkZqkieRRSkiHsMgChRMfPS
	t6UN0c/MEqfWhYtGbhW7WIu7URVOey1vAka3JkMyO2nTZje5gCDESwdfPaDNtoswdrBpO55APjV
	9t1PME9FUXY1M1syqtMp9nXizlTsvT/BK7B8kevwEgQmEWlMscKDIB32F7quiTJ/3Ng/8
X-Gm-Gg: Acq92OH09Gkzp3DpMJqIfgdK+ge/sJM8oMZ+jV7c7znPjUyUFN/W3rJMjO0oSngLKV7
	tbj5Xk7ruuCZkFmACmCJXNyJ7aAl7pxxndqiEhT7EOnlzrqtFi44QrlSRuhRiJx9W6Hcahlfmsa
	4z0RpXSTH2QDHQWFKPNcxJXqflCU732TQM9tVB9SWWao+O1ydieZZ/1xjnOmXRQwvStEW9qTrKZ
	q2DFFWR4+VK1Nb/xmbvHB47OZYP985qpH0N/BT2+OsEBPu3HHmgDhrAlOGl6CQGTHnROK8Dl69S
	v8mRBEa0UPK6shL8LVZRPKZKaUYs3uXeFLEjvefhL+nlPKX8mOcTf04vk9nBQEjcpP3vK+Iw4yF
	ltJ4/xwthdcqMWwyTHXFC0yGzIBXSBclyZyA/Mw4tjsgLqA==
X-Received: by 2002:ac8:5f06:0:b0:50e:487a:bfef with SMTP id d75a77b69052e-517fe242998mr177624011cf.2.1781605558873;
        Tue, 16 Jun 2026 03:25:58 -0700 (PDT)
X-Received: by 2002:ac8:5f06:0:b0:50e:487a:bfef with SMTP id d75a77b69052e-517fe242998mr177623691cf.2.1781605558432;
        Tue, 16 Jun 2026 03:25:58 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937949fb19sm4637499a12.27.2026.06.16.03.25.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 03:25:57 -0700 (PDT)
Message-ID: <eb693705-c0c3-427b-a924-5aa907fd65bb@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 12:25:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] input: misc: Add Qualcomm SPMI PMIC haptics driver
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260616-qcom-spmi-haptics-v1-0-d24e422de6b4@oss.qualcomm.com>
 <20260616-qcom-spmi-haptics-v1-3-d24e422de6b4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260616-qcom-spmi-haptics-v1-3-d24e422de6b4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEwNSBTYWx0ZWRfX8yvkR+K4zu6l
 cmrBpx7d4DX5MXsC/EqULG/qfnzuBVCd5hTTuPx7I9i22AGQJC9Awvj/kCjqU4Z2Gbc1WdhRP0F
 0ZBAoWpvfyyTjzBurb5TtDIndZDW8GQ=
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a3124b7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ana-416hF8iW2EXVXAIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEwNSBTYWx0ZWRfX+hTgTDKveFcZ
 8EuFYc2VoqGnYOs0ekFHVXiOUpbffRONDGLmkTAxvITj419SS+bXmYl+9pPn1QLn520Q9OmBjAp
 fM9EhxPpDWavzeeLH6f56ccGgEcNA6QfLgqiXmO7tC9t2RvHM0XAc5FnfwkH+2lsPkjWIR98DIH
 axGCX8QhofKGqdZlrnOG6AhW1O3pvuVa+GKUij4qPILucgWaoMWptjAKWczm1PfiiIPtls8f8O3
 3+BhhbdrrXZ7xAtSNL8BxTLWZVPQoajoErXmazZSvwaaJdDrhyg+lCqmTK9LfDuosUT6kRP8S7C
 PubPSNVWcLDVTZPcy6bKb2cSOhKedF7TP/mY638pmSWYG3WjMxYkQFMhTlK3raqEni9kqnDTyk4
 CJ/wyaFp/Qcc/Eo9eSq6iz76WSb5PSo2wbPff3jv3nxtLbVpaLjEPpL52erTWnjEldnpAhivMpd
 SUENP0mMey4k1x+cGAg==
X-Proofpoint-ORIG-GUID: UnkJni3kKHXagGpsDRZDILaqXN6kLN1O
X-Proofpoint-GUID: UnkJni3kKHXagGpsDRZDILaqXN6kLN1O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0
 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160105
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113369-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:fenglin.wu@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:sboyd@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: 4E24768E416

On 6/16/26 12:08 PM, Fenglin Wu wrote:
> Add an initial driver for the Qualcomm PMIH010x PMIC haptics module,
> named as HAP530_HV. This module supports several play modes, including
> DIRECT_PLAY, FIFO, PAT_MEM, and SWR, each with distinct data sourcing
> and hardware data handling logic. Currently, the driver provides support
> for two play modes using the input force-feedback framework: FF_CONSTANT
> effect for DIRECT_PLAY mode and FF_PERIODIC effect with FF_CUSTOM
> waveform for FIFO mode.
> 
> Assisted-by: Claude:claude-4-6-sonnet
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---

[...]

> +static int cfg_write(struct qcom_haptics *h, u32 off, u32 val)

static inline

although I have mixed feelings about having so many accessors

[...]

> +static int haptics_write_fifo_chunk(struct qcom_haptics *h,
> +				    const s8 *data, u32 len)
> +{
> +	u32 i, bulk_len = ALIGN_DOWN(len, 4);

Please avoid mixing multiple declarations and assignments

> +	int ret;
> +
> +	for (i = 0; i < bulk_len; i += 4) {

You can do 'int i' in loops nowadays

> +		ret = ptn_bulk_write(h, HAP_PTN_FIFO_DIN_0_REG, &data[i], 4);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	for (; i < len; i++) {
> +		ret = ptn_write(h, HAP_PTN_FIFO_DIN_1B_REG, (u8)data[i]);
> +		if (ret)
> +			return ret;
> +	}

So if i'm reading this right, the first loop will always write
4*(len//4) bytes and the second one will be entered at most once,
to write len rem 4 bytes.. should this be an if instead?

> +
> +	return 0;
> +}
> +
> +/*
> + * Configure the hardware FIFO memory boundary.
> + * FIFO occupies addresses [0, fifo_len).
> + */
> +static int haptics_configure_fifo_mmap(struct qcom_haptics *h)
> +{
> +	u32 fifo_len, fifo_units;
> +
> +	/* Config all memory space for FIFO usage for now */

What's the not-"for now" endgame for this?

> +	fifo_len = HAP530_MEM_TOTAL_BYTES;
> +	fifo_len = ALIGN_DOWN(fifo_len, 64);
> +	fifo_units = fifo_len / 64;
> +	h->fifo_len = fifo_len;
> +
> +	return ptn_write(h, HAP_PTN_MMAP_FIFO_REG,
> +			 MMAP_FIFO_EXIST_BIT |
> +			 FIELD_PREP(MMAP_FIFO_LEN_MASK, fifo_units - 1));
> +}
> +
> +static u32 haptics_gain_scaled_vmax(struct qcom_haptics *h, u32 vmax_mv)
> +{
> +	u32 v = (u32)((u64)vmax_mv * h->gain / 0xFFFF);

mult_frac()

> +
> +	return max_t(u32, v, VMAX_STEP_MV);
> +}
> +
> +static void haptics_fifo_irq_enable(struct qcom_haptics *h, bool enable)
> +{
> +	if (h->irq_enabled == enable)
> +		return;
> +
> +	if (enable)
> +		enable_irq(h->fifo_empty_irq);
> +	else
> +		disable_irq_nosync(h->fifo_empty_irq);

This is called in the .remove() path, I think you may need the
sync variant as the underlying device may be destroyed before the
ISR completes if there's a late interrupt


[...]

> +static int haptics_playback(struct input_dev *dev, int effect_id, int val)
> +{
> +	struct qcom_haptics *h = input_get_drvdata(dev);
> +
> +	h->cur_effect_id = effect_id;
> +	h->play_request  = (val > 0);
> +	schedule_work(&h->play_work);
> +	return 0;

nit: \n before return is 'nice'

[...]

> +	ret = device_property_read_u32_array(&pdev->dev, "reg", regs,
> +					     ARRAY_SIZE(regs));

Here you use device_property_

> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to read 'reg' property\n");
> +
> +	h->cfg_base = regs[0];
> +	h->ptn_base = regs[1];
> +
> +	ret = of_property_read_u32(h->dev->of_node, "qcom,lra-period-us",
> +				   &h->t_lra_us);

And here you use of_property_ (please use device_)

[...]

> +	input->name     = "qcom-spmi-haptics";

Odd whitespace

Konrad

