Return-Path: <linux-arm-msm+bounces-107756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFMPFa/mBmoHowIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:26:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C035F54C5FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:26:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 97F4C3072B0E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 09:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93769436372;
	Fri, 15 May 2026 09:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NZAND3AW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jWTx5PCq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7B5402442
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778836802; cv=none; b=VOSfg9vO4nHhzNg9TF2jz0jEEQemhyXUFfTPz4gdEpZVKHuP2+zSE0DDfutGrxNso6/spBraObt+pC701Ol6zoDuc0RKIjHqM/04t7hYYPBkE4QNuzJQHvIwaAU6hafrUSP2NiaffyFjr5vpNs4igxZYGnmrIgl46eT3Tc6K3DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778836802; c=relaxed/simple;
	bh=RCnxFa+yI5Y9Xy4053kfK+km7U3a/gFtswsMRuExpyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OrooFQLIfGRx7kVIbxh2bLHTTeSj8q1k9Lj7e1lFmhY4NnG/Mr4wTsq6OSRWjWujjl5jJ8vUskX+rSBVxXVKm65w/JHe8rOjM7ZqvGZiNmkCUju1VFZntOc45avh7sQzDgjBXqR1Rwz/gHrf+t5DgXkGyrhtBx+111/0NgBNqbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NZAND3AW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jWTx5PCq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F4ObRT2676446
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:19:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GuWR6ejKO60MeLWfVVXF1au0lbdF5Zpf1WZXUVNB2FA=; b=NZAND3AWTQ096osm
	qGmaAQmSJq/9kjCw3HDKjc5laOZsbeOdIbvrAo+YMxpO85bqSJ2/bzXHw0DpxtRa
	ukXqut+TATrwgwKxMzjVE8Fx8MFI4NhBZVksV/iHPBYeGsl4FGn2MctWNWXGUv6/
	5YrOKYy6B7jdXKw4C05Hw+zWQ+xwtRi+9sNQuFjF98pM/RCyGLfq03HGT2Q+kXPp
	ro4HSFfWkHVW9o8sb471XMHrOpkOp8shez+QNInD1j4Jh2EnLxCoJB0MibODp3Rj
	3Y0YqCjMXrXUSf8fcFt7+KoHV5qPV4EW1HU4hV8+A+RetMwsBbdD8BDRgaUMW6Wt
	/3Ytyg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vtkr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:19:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fad7b0ae2so19893781cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 02:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778836798; x=1779441598; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GuWR6ejKO60MeLWfVVXF1au0lbdF5Zpf1WZXUVNB2FA=;
        b=jWTx5PCqLPZqTWTQF1U39guAD/Di5Fv1cIJmSftiYUUOS5IrQq6E44xjOnOyTEiruI
         zc64mA45aArwYoq01PpWJjnk0IFMd3E4BKxj/+9TrEyrqudkELeti+5yD65uPRyQT0Os
         ptr8kDQB82W2sQcTcYa5SzR5vW2q572MnR3dm9P+OAfXChYChutUaUfb9CGi8RtVEgz6
         ZNyScVouW49pBffCxqTU7UHPqgYVoQj0LBFKFRCwk8kcd64bV1EIz3XhfI8qd/LzCPsc
         piLjDS7Xg/cIQb1k/hgkkBsYlPwwKnqdMs4lIQEpMhiwjHbC0rkPXEGUvIJemQKJ3jrr
         3KjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778836798; x=1779441598;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GuWR6ejKO60MeLWfVVXF1au0lbdF5Zpf1WZXUVNB2FA=;
        b=OF9VYZEtu8Ynw5YXD4Rd9jMLPyNQRvKD4i6Tzt9rnFdIo7M1z+HBXiIE5Uh/ZSq0S+
         iLI1noNlc6OkJWsS+M+pnu+gA5ZUbu225XuJFX1hxKdaMuRQ45UeDmitPkC4bqkaA+9p
         dpOht464hsTLvPlQwcIazSRXWRKEpgB5A4yLXURm+bmfKxEw0UwXO5v+z06xOd7TngCM
         tLTPl6+bZVJp4h+pX28IbqImW6aTL/Fx9EgILL9RjGm938o56aFSeppJAFYmcAM2xVQe
         LJSWduxYibLSbu2M7w75HstSsBURFMiFmyytEoTL7wg2g38JodeMCXExGk0w8V6WEbj6
         OhXg==
X-Forwarded-Encrypted: i=1; AFNElJ9HDw0Lc/KN4Jhy1spvJUAUZAgHe5HTHDqDGhV2z6jgcCaIhj8A7GztOOF5EEXB1BxmYYCQZfpfsPpfVUBZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwWDo55puSwU4/82uFc6OYDpVkhX76JSKR+RVy9dtKNZ8w0q8cr
	1jLJ4JlDlrbSujP39zUzyFoYCrL2YW01yS7e8FDo32CWeNT0khI92k1B1AHJ9rFtZpI/uNKwTpk
	fa550gYupFwsxAqoQUNdOBj4dGh3Vjjdv1KrP7O69Q6wLW5KV0P5eXIfI8s3mZuYG3+8o
X-Gm-Gg: Acq92OG9kVg0OV+f1c0F14fmQine8Af5ShSzpIemWzPklr9xVXfCtew5HKdaSyZKOeb
	mS+duQ68bw2FxkKiyuVPa+BBT8o7m2Yn49D3LvyXJ4P4RPcEL7D4PUQSGLKuZojBkiC32tW8lkA
	2r3o+2ycfNLoi2Sxc5xIMsoLVwgfIwi61ahsfCq9oJFXVhaEyCrIE+dj3vJGvpIA16eNiFP4osh
	xGT/IdbBLRpEcWo1vR7T9JFqaLr/nPvRZiput9eBZaHGCmCaDIWemdjnWYWp7Qep553UAvHl2xx
	Bwo7v49Ug4VetZ5rneG/OjJmjM+4JkpTbYNBQ7lN59AXeRUwbJUYj4g7bQMAzSpHvpeoVlTnk4O
	8JoAmwi6vNttFg8IzYVTzPF7+/vhXyZQPgla8kaKZQCfvwDb05Zmzspr68qOXk6yqHU+laK2+U2
	GX5wU=
X-Received: by 2002:a05:622a:594:b0:50e:6311:7380 with SMTP id d75a77b69052e-5165a229508mr30234431cf.6.1778836798662;
        Fri, 15 May 2026 02:19:58 -0700 (PDT)
X-Received: by 2002:a05:622a:594:b0:50e:6311:7380 with SMTP id d75a77b69052e-5165a229508mr30234191cf.6.1778836798206;
        Fri, 15 May 2026 02:19:58 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b3e800sm1842166a12.6.2026.05.15.02.19.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 02:19:56 -0700 (PDT)
Message-ID: <c898b619-676e-4385-a69f-cd1e6dc2f9bf@oss.qualcomm.com>
Date: Fri, 15 May 2026 11:19:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] cpufreq: qcom: Add cpufreq scaling support for
 Qualcomm Shikra SoC
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260501-shikra-cpufreq-scaling-v1-0-c78b95f53b91@oss.qualcomm.com>
 <20260501-shikra-cpufreq-scaling-v1-2-c78b95f53b91@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260501-shikra-cpufreq-scaling-v1-2-c78b95f53b91@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PKE/P/qC c=1 sm=1 tr=0 ts=6a06e53f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=4ielwApaMtWjWprE9YYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA5MyBTYWx0ZWRfXyzpL72C6LGia
 NLgrdL8xvmnmhcdr90YUvhYXSN5cAppz3hcrZmFd3kW5J/4RQHMVkB/H7c36PGzJEuiqxX9rlVM
 /2/mRsPuhf4jlWo0wKDroJdsWMw2xHw9+JuUF+vsXJyQLOgaH8au2mF6GMuPLt4h7TxC6zJ8vnY
 U+xf3/BnX7seCh2U+r3BU0TQR2c302VW2qAu4ukyXw7M00RNaEUyiLR/41jEe7lXmhD8P80IoiQ
 P/MiATOue74Ngr847woXvWqQGepcezd5zqqXzDn1lgU7mPSVWsG5ODk2FR41OJPezIzu2oB1WIG
 ls6Uym+EcPeUyFaMOa/aBnDRDMsMEhrLc6GPgWlDLTp8C01gIyWGK6ZDpZjWLhvuww+3m70xjB9
 RRLc4MKbFUS37HNJLtUcrLifPzGjZVx+2Hqxj3a6GTfv+PHq/38tBp046qhTuA0kTP3ffxlJ6x6
 HRvCU8LHQG17X//zzwg==
X-Proofpoint-ORIG-GUID: Mju6XV03vFhytFh4PvlVYSrY3btEzHg4
X-Proofpoint-GUID: Mju6XV03vFhytFh4PvlVYSrY3btEzHg4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150093
X-Rspamd-Queue-Id: C035F54C5FE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107756-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/1/26 9:15 AM, Imran Shaik wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> The Qualcomm Shikra cpufreq hardware is functionally identical to EPSS,
> but supports only up to 12 frequency lookup table (LUT) entries. Hence,
> add epss_lite_soc_data that reuses EPSS configuration with the appropriate
> LUT entries limit.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

