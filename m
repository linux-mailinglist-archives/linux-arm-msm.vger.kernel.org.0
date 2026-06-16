Return-Path: <linux-arm-msm+bounces-113419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5SfQI+9MMWojgQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 15:17:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B8868FD3B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 15:17:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=durfiHYN;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=We8PQEIH;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113419-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113419-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A66FC301F4C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BD82318B96;
	Tue, 16 Jun 2026 13:16:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140FE317150
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:16:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781615793; cv=none; b=D/7a4Yy/hjQKhqe5b5UASu18Ae74KHRB1zCjEpZ6AeXBXnOWSaBPtOZRcNye8e6xCyy8H1MdHZd+HHamjgeevDWomfvgb8QheYixIpAzdX4LxFdInI3WYtEXyPlCmTBd9Fhl8maAHSbm6jZ4fg8EqytaeFnUQvj5CVIMVYLbsGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781615793; c=relaxed/simple;
	bh=49PdK05MfJuPjs1aRlijj6dHIPLp72WX74A/rJI6gok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pqXKAQ14REDhfMo087VyMzEcPgon3GBFmm3IgYfVabxm4Kj9IQrMuunWc27Xq1p3KGAOslPpuKgrYUAVdenoBba8Jc8nqzWxlEWHBClPoNFO2HqVasMvVLWtKZqJ+YhsqkgD9CuSlFmWcirJsKwl7OploL9B41+rquZv24D57vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=durfiHYN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=We8PQEIH; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9hft2799344
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:16:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BowRZ2AS+201sr5j8jJBVB2tSw9pjrUlTsmfC3fjNtg=; b=durfiHYNrkEpvh73
	Q462eTqBlCeQulUOGCwf/kh43n4TaCYOJVAwewBOqK4XpXk0wFSmnHdLq/U7xfpm
	l1pf/A5sNVN/qRhrSzWhsvSKFzKxq6iPLkq9Jur3t4B19aTBxAqvocq9yhCuGeAo
	9YfmcYECHLXFhEpthCZAZTIwfzHO9z+EbycTSaBQG4mOUPk9qTHw/wmkihsWOPrv
	/dUpNBfw/V3N7LqUIwYdkzSLxEgJDyNCEAY5BHZbegbbljvyFvG1I1XSU3xmzW1E
	XVUhy1bSW/X/Sqgtp/wklban5G9bpA9ro4xhs/9aTXReBnbpxw9EIk6DNrD/nDQm
	S9SPCA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu0a7synd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:16:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915976b2dffso34656785a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 06:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781615790; x=1782220590; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BowRZ2AS+201sr5j8jJBVB2tSw9pjrUlTsmfC3fjNtg=;
        b=We8PQEIHJ+LC5VHPYko/TDV82PZTMyoP1ZDgT2v5DBaqvbtcwV00/RsGo2vtfE5j6l
         1gb6x6vwa7fK3HB77hpd0Dertlk1M1AdYk2ITjeXM7ChmxuCUQ6LQNABe+iZ2UaG1iaP
         lLwSs9A5IUb5soAb220nn8Yfym3zUxofnFuSOqZIaR1CyUg4i7MoqMd2+za8OBN67Pvj
         NKzg+IRnaZTmearzv99jT/5MU4HtlxIy2DFbJRgDCZigxR/yHLZeMclPc8BHMvbwfcrK
         05v/VuyLcaeg/kW7O62CgHtqBYP826Jqadtjf7Io3S3Ae7OrHONg8NzG0aWt1Q94xmTN
         YzvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781615790; x=1782220590;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BowRZ2AS+201sr5j8jJBVB2tSw9pjrUlTsmfC3fjNtg=;
        b=eCXkYGcWq0DvhqRA+GHad093HD55HkhP2QgxzPLDxy84z//6JFNywIo7IdmfLS9Yul
         IFGffh3g+hjwJD6spigsdO5L88KSId8gDsFaPesUTe69/qkQK1nwYetHaPuOq80nCNH9
         JEGwuAmNXoQUrC+yoD3ae5tM4Qa29JdMy0FuIitHgiFE0O0RXrpO6wHXUmWxr4ueo+8t
         kIledh8MB0JHghIp5Bok8EhMoQoBLqdB3X6qZ1yPAZ0BV9xHOHiDMjmYyPexJdstLmnp
         Tjgjde06MtqkEsNAxGZBk1hdl1xso2FLRDRZoS2WKj2myrP/ZK/9UbUnh7Ofx/XWwyfP
         nhwQ==
X-Forwarded-Encrypted: i=1; AFNElJ8pKQMnFO2pVRRc/ZF8Ie9gRdHZzdnxyHkWzS78ZeuX7PgknDanNFczBTUE/kgcMEuJ0SJlSBrjo3bDT4Rq@vger.kernel.org
X-Gm-Message-State: AOJu0YxhQORdensIqqzcZOpDVQyGN4kUKVc07+VjD3uheXOGrmJj+//O
	KVswL0mNNNzqh8IUwFW4EJVq+4b5IbQnMzNm8UxePGY9A51D17l2pAcUfFp9xWOWkBnv8xyiV1q
	0UW9DXpDOIc5cjE+gO004dGr89mbkbc7Qwi+ndagF5mJTVfKK3VYXf5czu76ciswVmY61
X-Gm-Gg: Acq92OHFXfNEv6ffl4yCvEGA+uf/1HgmjAyfBoAhlLqUcSbVgC2vTGr2XzeU4rr463L
	K6Tt904wK2DCr54P1wWnu1jVFi/A/3s8xZlOjcegottp192kgJ1FCla38NjvA1Q/ROMYshYqk4G
	txvhv6YtXiIJBR/DzeoACoKatqKUOrmyjM+WEgYmEOFXEoadk0x/GBAkKBqBpZSRz59hBC1T4C3
	7p6x8+dct68qrICWq5+Srshr3OsXl6c+Ob35U+wiRxYAfPxf8gwvdLZJ6FcqkobDKlqQljBSyLW
	GpACvy2JJ8MHj+n1Wot+Gfn9CtUoIbX3X0fxNHc36kQzTC/fsSQ39xFpiapPm9gAFJuTAVw+0VO
	W04/wPDhjM+96A+LXid2HVUCNaIQr/+EEP/o+aenIj9SIQw==
X-Received: by 2002:a05:620a:2a07:b0:902:daaf:22cd with SMTP id af79cd13be357-9161b9598e7mr1677790785a.0.1781615790286;
        Tue, 16 Jun 2026 06:16:30 -0700 (PDT)
X-Received: by 2002:a05:620a:2a07:b0:902:daaf:22cd with SMTP id af79cd13be357-9161b9598e7mr1677788385a.0.1781615789754;
        Tue, 16 Jun 2026 06:16:29 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a730esm3517152e87.41.2026.06.16.06.16.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 06:16:28 -0700 (PDT)
Message-ID: <ea6a5d86-601f-4755-adc6-edaae29cfece@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 15:16:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: ucsi: unregister debugfs entries on teardown
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260611-usci-unregister-debugfs-v1-1-f4a518a94f27@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260611-usci-unregister-debugfs-v1-1-f4a518a94f27@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEzNSBTYWx0ZWRfX93+HlV7q2MOr
 2ufbHnsL6maimn2YpdGOMx46EwkJzOjcaQlCcgB6PGd+y2Bybl6lVERLt0Iwp1Z8O1riGBCnrE9
 WcnaDfufPVNdVopVr1lcaKBU+Ah+fBXIYW9fzOs5rPeiHr5FPjGrtSifqMjMS8HdKwp+JPwHA9N
 1/rDA+HWDHsXYfeEtW26EqhUHHZjeLv3XICQXnyY0qMbR+ktQXQkLTaKmCD+rYT3lsDt+f/xUL0
 bx7j+NZIyKDuKlcVa/LzaS01XJKOgQ/UEYTmc09c7BFZX6ZBogDIgflxaA8d2rX6xcXspmf26I3
 kAD0mzCBkT1eeGum+3FHwfphjCbIZY8GQvMG7h9bZKO8G1zUPwkgvLw8Syx8eJdM3Qz4juQJrfZ
 W/QVYvV16XrzTJQCq3CHRvHDMx2r+/3Rbt13NjEAU7a5sZKlOKBKIXdKoo20ads4UMUZfKQL1aO
 1JQ2CeNEI65ev1/aCog==
X-Authority-Analysis: v=2.4 cv=JKALdcKb c=1 sm=1 tr=0 ts=6a314caf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=N3f1q4s7xJVnOBk5yegA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 2tERPCu7B9nDNtQvJyUOYsVAlu8PR8LZ
X-Proofpoint-GUID: 2tERPCu7B9nDNtQvJyUOYsVAlu8PR8LZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEzNSBTYWx0ZWRfXy9K4DAsLgzVm
 Z3muLnDoj1BWdpnbYZuOFpOoWMRpWMp3xeCg/0GEM+TRDbAmiVGnmClaHgoViGotulUX97kODh7
 4VMFr7oalIAZyj/ClDTPa/zZEuHYKnY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160135
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113419-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bjorn.andersson@oss.qualcomm.com,m:heikki.krogerus@linux.intel.com,m:gregkh@linuxfoundation.org,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 80B8868FD3B

On 6/12/26 12:22 AM, Bjorn Andersson wrote:
> ucsi_register() creates per-instance debugfs entries, but
> ucsi_unregister() keeps them around until ucsi_destroy().
> 
> Drivers like ucsi_glink that unregister/register the same UCSI
> instance across remoteproc restart then try to create an already
> existing debugfs directory and log:
> 
>   debugfs: 'pmic_glink.ucsi.0' already exists in 'ucsi'
> 
> Unregister debugfs entries as part of ucsi_unregister(), and
> clear ucsi->debugfs after freeing it so repeated unregister
> paths remain safe.
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---

Fixes: df0383ffad64 ("usb: typec: ucsi: Add debugfs for ucsi commands")
Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # X1E80100 CRD 
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

