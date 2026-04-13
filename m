Return-Path: <linux-arm-msm+bounces-102927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJUJN3u/3GliVwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 12:03:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3253EA2A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 12:03:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA782304D43B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 09:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E2763B47DD;
	Mon, 13 Apr 2026 09:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T2qqyx4M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H+PnUkua"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662F73603D2
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 09:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776074318; cv=none; b=SQymgg892KfsjBPSRpKYhrGtpDnWRCwrZK8VoNmI9VjGOrd/OJ+aQ53wUoe6rwN5Ximkp2XB2DwbbMA9mO0W/e/EyxMdQSVNDR4W4mvBV5CVd43ASCQAdL8czaEuwBwkLRgukH84ECmgySQ3AayEIuFF8Ljr99UqWppiEcGhlog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776074318; c=relaxed/simple;
	bh=bUMOaqMPAsCT/nbli0ldz/z35LS6QJphElFnOO2VfSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XxYzINyo5WzXptF1Xk6FTV6pJFEIU8IyqC7bMhYjdF6ACyCdrrSROTVvM1CIvvmXLq7D240VHLbX58MiRJ23EnHA6jt2ygDXGn6WnFBtQeGsNQmQdhftShE9buW+fm2N1whkexg1ow3OwJXtBKlMrSDOiNF/A+kMKbVvbW2A1Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T2qqyx4M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H+PnUkua; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D6P13u1121575
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 09:58:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Sgk0kmsJKoRxvHNPoo8Dt6uNcK3kKUI0DDx6D9sQO0=; b=T2qqyx4MpNejlRQE
	h9S7PyDW18sqeHh6oMmpz14G6eqPGGtGo06RPBJ+IvJTJzhiaHlqMy4W12IpocFc
	BUyYwB/tFqlVjwoLcy/+70zu5djzgXlA1MuHp86jxutPj78rIBNH/cSywlfOcBTj
	zscSQ4cXlD8pOfORpupVj24b+hBQiU5WRSi3LEfKjF6Sy03ZiNP9sxowQkuj9F1r
	c4ykScwrqXqNK5/v19q1VTpGtEyuATpsxdthxRZECq5aSYQqW+exy/fxXY47jVQN
	WnqrHo4g1SstbRSWgV4LZFgcWip/OcphZkjXRbLNYPY6mwUypVulBRE9e2rvgVrA
	dsMDlQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff0jvqss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 09:58:35 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89f548d0872so14010616d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 02:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776074315; x=1776679115; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Sgk0kmsJKoRxvHNPoo8Dt6uNcK3kKUI0DDx6D9sQO0=;
        b=H+PnUkuaap+szKNdFMr73rK4tOxT3c7vjkTb+rh2lH6wzgg8rOFO41J2ObsxC2THgK
         VtieOshZzVHXYm162l8p4E5hl2/31c8h0AfX7aOIY7iuhswVKXZTxzLhhMiSCpifxMiA
         bf9WFK8eWIuDglSxSRKnbt6zfL0u43R2JJ9u6MMFkCfMqzbZRV25yp6OY9Vkpy7Ndt6i
         NVC7FtAlVNtBJo7x/HAbbktc2ley5a9XrbcYMY/2NpO6WYqHwxlbvHqsqdUlrfV6QHpo
         fD70aprWb7bk1yu7AIpwghN4rZiKXW8sUj6RBPOiKMQimJ6nvp28FpcgIXI5Lajc0A84
         bfmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776074315; x=1776679115;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Sgk0kmsJKoRxvHNPoo8Dt6uNcK3kKUI0DDx6D9sQO0=;
        b=Pd1KB+fQa+U5gc6w9OpEKirBpkh2IZf2suOl09XOjy/ZDhQMLROPI5x0/mNfySILMK
         FHnop5USDviiWYgCk8Hxrwxc3R79Ga8r6yloxxu+dAOFUWxTR21ZhVR86bRiQPvQVSo5
         g9N9RlKz8j5pKTWP9SHbgzdjVbFqqPO33zjAhPnMCx0kL9LLJD/7Ms43dvi+k2CUMgPh
         vAz6f20u712FSCfuQeyiEvccisln+r7JneoAfpV1A49TQ1Bgqe9cuXE6R2LCl4JcdL1N
         eUKbT/RJHkcWw+zlyMuZSNwd15rz39XHxoo+IgrZZtoEDUP63CCzZgpLB+r3KGboQI+a
         ktkQ==
X-Forwarded-Encrypted: i=1; AFNElJ/0mrAZURJ63E6a0qB4RExnPy/mudKUfqTOaNk2HeK9LXVShbMynx8eKkEgJBDfgikIRYr1NWeF0JZ3mhCt@vger.kernel.org
X-Gm-Message-State: AOJu0YxZsKH9SRY9MjQL2ukzNYeC6VbkPnp/kP6LEeh24f6GMOKIgxbO
	ftZUu6yGhP8lw9Yb1vtqru35cqE5MckfJEkCjDByLkdHEez4EQLebPF0YRpX+J9HKMmIVnzXAus
	sAqjBFHVms37YGXlkIQHESPXbV1LkQCuZMFTD+J9H66YyiPCi7pFnysjCK65tv8hySSiU
X-Gm-Gg: AeBDievQL10KXHS+vtTlGr5ZRJAurtaaZNehremuB68ClsM9M6B76+g8C8pm1t7d5CM
	3L/Ls09fPUAExk9BMxTsP81oC3cPWRTxvtxmqu3k4aqxoPgClIC2i7PSVO25jbc81Vofdyz8eDN
	2OHiaFKLz/GQKzlhFh8K77lIWOkMKmIUYczDokp5/VW50RhxMeRsptz692E2ov+oqhwOgp4fCGb
	KSNlaRMszTsYGqlbrNYVVM300LGEYDaPX0HI1OIeHvYu8oeLMB1O7Gziheh2bB8g5RngYPlBxzM
	oSiSLc+4twCTdfiq7IZikpw/TFHOF6ZsWdhQf/ox3g+5CwGtxBN2VkGoSwQZ4DPJGdzwD1FAezj
	LqTXM1yE+18vsJ0NXoXhTVN+d8DTTxBRelx3w6pttdkbYmktLyhSQoPSxK6PuF1MBzC37nvDFYF
	RBovk=
X-Received: by 2002:a05:6214:258f:b0:89c:d639:e7be with SMTP id 6a1803df08f44-8ac874bf3c6mr134115596d6.5.1776074314825;
        Mon, 13 Apr 2026 02:58:34 -0700 (PDT)
X-Received: by 2002:a05:6214:258f:b0:89c:d639:e7be with SMTP id 6a1803df08f44-8ac874bf3c6mr134115396d6.5.1776074314343;
        Mon, 13 Apr 2026 02:58:34 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e5c583asm289905766b.36.2026.04.13.02.58.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 02:58:33 -0700 (PDT)
Message-ID: <b4d10bb3-89b4-42a7-9362-8d43d117a121@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 11:58:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: arm: cpus: Add compatible qcom,oryon-1-5
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260413091625.607976-1-shengchao.guo@oss.qualcomm.com>
 <20260413091625.607976-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260413091625.607976-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA5NSBTYWx0ZWRfX6rTrCShVeYDo
 wFSGKEbgmZ1Qvx5nCbJRtduoMTG8k8KEGmYrMBfhkV4LypSyHgxiQaryd8F9KTVDRaJ3v15Bncq
 XBb7HG0ueUiNN/3ARk4tY6GnEFfvoSYTVrqNR1Op/8Vp8UyUAtRgsUKXyABjLYzt4sZtQGhC4Rx
 UfDXqIls5NtTx4tVsKAgG6cw5H5CdFkS3uv8xCZKLx1/uFHsbhT3mmUU6tvoz+n1GUFJrCj6hAX
 c0eRIJpzKhHLq1mUqAq1wKA4kW39hXCdeeBC9G1bI1v1tOTJUhk1BoykbkTu/PyiMF1osydTzbp
 IT6V4nR1MVBfCByCXIyUe4oyoABHD3SxK2qLtrRROKyoGCcS4EdeZ3vc/vauK+Ebg3z+AnvCKfd
 /brU7G7qnhSu+MHaeTlfXz4Ba5v+9Z9bA6TEDNWn4o3Al+VMR+BLDFm6ZbIqYrEEDfeRiJZE3Dc
 D4Olqke7GZyYHkVTHjw==
X-Proofpoint-ORIG-GUID: WmSu1osRnRyI936vE6N4LfKni9-aW13g
X-Proofpoint-GUID: WmSu1osRnRyI936vE6N4LfKni9-aW13g
X-Authority-Analysis: v=2.4 cv=d/LFDxjE c=1 sm=1 tr=0 ts=69dcbe4b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=3VPC4Hb_SbXWmmKAefIA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130095
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102927-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7D3253EA2A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/13/26 11:16 AM, Shawn Guo wrote:
> Qualcomm Oryon 1-5 is found on Nord SoC.  Add compatible for it.
> 
>   $ cat /proc/cpuinfo
>   ...
>   CPU implementer : 0x51
>   CPU architecture: 8
>   CPU variant     : 0x5
>   CPU part        : 0x001
>   CPU revision    : 4
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

