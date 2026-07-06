Return-Path: <linux-arm-msm+bounces-116639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E86YKJpIS2ptOgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 08:18:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EB55370CD42
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 08:18:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=b+6sPStd;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ek9SsCks;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116639-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116639-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60CB13003638
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 06:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7A173C09E1;
	Mon,  6 Jul 2026 06:16:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFAA3C060F
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 06:16:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783318597; cv=none; b=iHqEzi4dTrrXg8dmrYCFUU6r3WJNC82+CDGT5Lb8TnOOsJzBYS59Jq3jHJCHbrz3CPCkHLwFo8Hl6e1/FhGoYnjDR/t4yT6UTaBj/LtKvt5kRwhiZrhp7lnnYZWuBtbPEpN8LkJGxFGZJVayVl4RJQQixZj0Yg6w/PtbNQZebjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783318597; c=relaxed/simple;
	bh=Jo5NDlCtpPLYNGZLIV0L08BEso1Q3QK9wgkgCiGKIPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nDIpgNR37GTBgsDIjEc0Lhi9H8vFzXZe/rXJm3TH42SDbqkd5WCsR5dqHb6BlUhW+dkgMSIJxlqoNLBfaVOgh7v58ibNltKCK3Nzx36tuPalP+4nbqPJFbOfHBYuNi/T9BU1SBKW2/vxMLX6ZUu7GJvE+Mp/ltoNLVPX2n0CR1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b+6sPStd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ek9SsCks; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641cVv3470529
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 06:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gUTk8sYwNkAHjVq2F4TJJ5lnD4yG1DgRrEDupwQVYKY=; b=b+6sPStde73fF+50
	lwoolqxNaXGnX49NC6CkU4eyfl1Wp0O4lvYvxnXmWANPBY786/eCTGLVjQn4WIeP
	q1s53E2uLax/nbnUR6VeLviPkV8z03r3GSZBi48heGkvXqIzuvqGyfSD1yGOuIgp
	8ABxe3RazbQa6Fk58fSVn0PBAKMgn+g3YGFnHIoYpC5fnM88fFGk5SdM+F38P3T1
	OxmCUZFPA7A4DBr/aqwHs/qZyLK5HQRD7YcF3nX+Qs3uuI88qQex/I8I6vt51JaS
	0ei4ZafsejzWCdhO/ngbQiTr5ebDuN0DQLY0zPN0VjzOkkhK0VCYDgbAJOo8vaKP
	McZfHw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txemhw8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 06:16:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38096521198so4010358a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 23:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783318595; x=1783923395; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gUTk8sYwNkAHjVq2F4TJJ5lnD4yG1DgRrEDupwQVYKY=;
        b=Ek9SsCksuZPA7Ud8aaJixpObll/fwdki3uhNmE4IPLhsdtDeD+3YWj+H2q9JpNZYKY
         DRsKD0YpvaD9EZwKen/EMAGkL6PVg8fjeYb+iA3kPAGwpNL6zryb2nnzzsL3HoMC5HkX
         XYXiqQSyuSOWhtdYsmppymeeNsluGTR2sXmdstHEemEmNaRFom4F1AT1ayVc9vPf4dQp
         KlR22PJPGg6LU6GMD+P+Liv8qdNkAP+rsgyIjW3jy0WyvX15U+oPQ1wLRYY06XEdPXxJ
         jxPWhlsk0AlOyCssIpz/qImwLCMfR1K9GNVoMHDf2XKZPvyjlKJ1E417mG23qag6ZOuj
         d7vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783318595; x=1783923395;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gUTk8sYwNkAHjVq2F4TJJ5lnD4yG1DgRrEDupwQVYKY=;
        b=FLsaGWEpXXH9juuYMUhnxwXIV/17nbBxBIDS7hxMYQVsxqPucW0O7AOcJVpKgUwHqV
         fQUjA2vk9TvfHzP5giGHflO3sPiqh5DRApPSwXignlXiEtA3PSgl0m3zZ38Mr7j8nwKa
         +Ab4oKHNiFRv433bnIBfNmWvhPyiRyvza0shT2RBC/OuxrMCWG02FUo1ZndU87skPjOc
         W1ammOlb0lMcNUoByaP5ibdB8t609Q/vP8oh6UJdXk2aCiyE82HPTbocCfyDCHTAWrFg
         D99Fcqc0gFbwKJp4bptI+cDGSG+gIs73qfp9bpyemAiy62zVY3rcWpkV4xwZucMui6QQ
         /5uQ==
X-Gm-Message-State: AOJu0YxwMQMBqPw1qps50xr4po6mObqLmnrQe0TLnt4GlaHSaIYWy/Yi
	tW4osm89P3PK43aPlI9tJm5+ko6fOu/N7J5pdrrboLQ7eGNvGSzp5WhNTD/U1nDwXY9CzcMAppc
	pHcAe26XsXQBl8/qo/YV2W/vVX21Eipa5reciwSmcNUIDpZhvdOtjp7pofQj+gZ3WRiYW
X-Gm-Gg: AfdE7cmlDtf6cFePqCEG41WducY5cAg+jbmG7iJJURdQRBBGht5szaY6t81s3WbbXKI
	LXrmSmE2CJbehe+bhp/C0Rny8DjDF4cm2kEClEdI8OppGd0NQ0kG9mZo3uD3Fc58cXUJ9jmPWa9
	ZBIIzTvD0psH12t4W8B3v1mt4OGBb05iH6+5b5g/xa2W0p+/aHmDsqZzHGEpQuqShY4oEI7j1x/
	KhGueFU0pGhgQGUFcTfODycgD7C4x5X3/qcsKgzY3Jwhvz3KpBiV42tz51TF9VFFtW4Ovy2ZqRT
	5OZPnnOZqN5hZEqvtkcCuQeYSFcTIePTwUL5dA8yGJK3N12k/49+QJRsL0HUEKuYKgew1t8b0+F
	QkvcF0MjrhpGOXhoBn8q8o3Mqr5S2ioZidiJcsqLOoQ==
X-Received: by 2002:a17:90b:2682:b0:381:21ea:9147 with SMTP id 98e67ed59e1d1-38281184e03mr10572124a91.13.1783318594824;
        Sun, 05 Jul 2026 23:16:34 -0700 (PDT)
X-Received: by 2002:a17:90b:2682:b0:381:21ea:9147 with SMTP id 98e67ed59e1d1-38281184e03mr10572092a91.13.1783318594328;
        Sun, 05 Jul 2026 23:16:34 -0700 (PDT)
Received: from [10.204.78.23] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3812815d3e7sm4191321a91.14.2026.07.05.23.16.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 23:16:33 -0700 (PDT)
Message-ID: <82310a26-daca-40f8-8bb8-f3ec015f9f0b@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 11:46:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misc: fastrpc: create duplicate sessions after all CB
 probing
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>
References: <20260609-dup-sessions-v1-1-26934abb9fa3@oss.qualcomm.com>
 <01d8d8cb-3de0-4267-9a73-c06287393483@oss.qualcomm.com>
Content-Language: en-US
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
In-Reply-To: <01d8d8cb-3de0-4267-9a73-c06287393483@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA2MCBTYWx0ZWRfX2JoEHVlgOfur
 jLd7oV4I2j8an3QZDluL5aGJivZ3U4LdjmNLJEYxTlW2mRG83l7X+JPs98O+i3nlwh7wO0/7d4B
 GeYGAVBf1eG/5bK05lPpnSKbkRL/BxY=
X-Proofpoint-GUID: H1QFNQyPLOtrb2dvzfJMbXyP1bue0Smy
X-Proofpoint-ORIG-GUID: H1QFNQyPLOtrb2dvzfJMbXyP1bue0Smy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA2MCBTYWx0ZWRfX3zlRrxtNT6Ip
 W06Fo0pSXx+tU3nP5pUAr66KvTCHkQHFdlvlGLdo88CS/MLys5cl/8i/aBfRttC5BuvcWV9TiS4
 TrdHFGeba+28xlCBMRFTRUVUiXjfp+7MaKBd2FCuyww0Femx5BfD8wyS4Nze8G9j37Pmg+ZY4kl
 XYfNd+RhP/PcmGnrXs4QR6Pw3YEV+htuUzirNEK++YtvxSnaIuqcoW86LWabNR9XiHLhlLx625f
 1ZjrTcWRkei8pegWf0PbF7qwoBArB1xBnzlpzO0gwTK7OQ+f2LH8fqMgGuC023r6APYe6WZwiJK
 ztkPjMZNi3rgJsmGVucRh8WfNj3jIVCWEYPLPQT1a+1tIFR+zneCq0fV+y/rSKSle9xskwYHMtr
 ToQP+dr3ErwIorbR0lR7oAST9UlF5r0l2tcscgKZkHumcDWn6AgKRtA/vJbpSM2YxELKHXtqCP2
 GwloeyWPStD8Zfhn6EQ==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4b4843 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=rCFuom7URbRVPiQ4E2kA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060060
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116639-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vinayak.katoch@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:ekansh.gupta@oss.qualcomm.com,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:bkumar@qti.qualcomm.com,m:chennak@qti.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vinayak.katoch@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EB55370CD42



On 7/2/2026 11:05 AM, Ekansh Gupta wrote:
> On 09-06-2026 16:03, Vinayak Katoch wrote:
>> For ADSP, only a limited number of FastRPC context banks (CBs) are
>> available. Each CB supports a single session, which means only a few
>> processes can run on ADSP simultaneously. If all sessions are consumed
>> by fastrpc daemons, no session remains available when a user application
>> starts, causing the application to fail.
>>
>> To address this limitation, a Device Tree change was used till now:
>>   qcom,nsessions = <5>;
>>
>> However, feedback from the upstream community indicated that this change
>> should not be made in the Device Tree. Instead, it was recommended to
>> handle this as a driver-level change.
>>
>> Instead of duplicating sessions inline during fastrpc_cb_probe() using
>> the qcom,nsessions DT property, defer duplication until after
>> of_platform_populate() returns in fastrpc_rpmsg_probe(), at which point
>> all compute-CB child nodes have been probed and the session array is
>> fully populated.
>>
>> For the ADSP domain, append FASTRPC_DUP_SESSIONS (4) copies of the
>> last probed session once of_platform_populate() succeeds. This keeps
>> the per-CB probe path simple and ensures duplicates are always derived
>> from a stable, fully-initialised session state.
>>
>> The qcom,nsessions DT property is no longer consumed by the driver; the
>> binding and DT sources are left unchanged.
>>
>> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
>> ---
>>  drivers/misc/fastrpc.c | 31 ++++++++++++++++++-------------
>>  1 file changed, 18 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 1080f9acf70a..46afbae9c234 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -30,6 +30,7 @@
>>  #define CDSP_DOMAIN_ID (3)
>>  #define GDSP_DOMAIN_ID (4)
>>  #define FASTRPC_MAX_SESSIONS	14
>> +#define FASTRPC_DUP_SESSIONS	4
>>  #define FASTRPC_MAX_VMIDS	16
>>  #define FASTRPC_ALIGN		128
>>  #define FASTRPC_MAX_FDLIST	16
>> @@ -2195,7 +2196,6 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>>  	struct fastrpc_channel_ctx *cctx;
>>  	struct fastrpc_session_ctx *sess;
>>  	struct device *dev = &pdev->dev;
>> -	int i, sessions = 0;
>>  	unsigned long flags;
>>  	int rc;
>>  	u32 dma_bits;
>> @@ -2204,8 +2204,6 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>>  	if (!cctx)
>>  		return -EINVAL;
>>  
>> -	of_property_read_u32(dev->of_node, "qcom,nsessions", &sessions);
>> -
>>  	spin_lock_irqsave(&cctx->lock, flags);
>>  	if (cctx->sesscount >= FASTRPC_MAX_SESSIONS) {
>>  		dev_err(&pdev->dev, "too many sessions\n");
>> @@ -2225,16 +2223,6 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>>  	if (of_property_read_u32(dev->of_node, "reg", &sess->sid))
>>  		dev_info(dev, "FastRPC Session ID not specified in DT\n");
>>  
>> -	if (sessions > 0) {
>> -		struct fastrpc_session_ctx *dup_sess;
>> -
>> -		for (i = 1; i < sessions; i++) {
>> -			if (cctx->sesscount >= FASTRPC_MAX_SESSIONS)
>> -				break;
>> -			dup_sess = &cctx->session[cctx->sesscount++];
>> -			memcpy(dup_sess, sess, sizeof(*dup_sess));
>> -		}
>> -	}
>>  	spin_unlock_irqrestore(&cctx->lock, flags);
>>  	rc = dma_set_mask(dev, DMA_BIT_MASK(dma_bits));
>>  	if (rc) {
>> @@ -2445,6 +2433,23 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>  	if (err)
>>  		goto err_deregister_fdev;
>>  
>> +	if (data->domain_id == ADSP_DOMAIN_ID && data->sesscount > 0) {
>> +		struct fastrpc_session_ctx *last_sess;
>> +		struct fastrpc_session_ctx *dup_sess;
>> +		unsigned long flags;
>> +		int i;
> int i was already declared outside, avoid shadowing> +
Ack, will update in v2.>> +		spin_lock_irqsave(&data->lock, flags);
>> +		last_sess = &data->session[data->sesscount - 1];
>> +		for (i = 0; i < FASTRPC_DUP_SESSIONS; i++) {
>> +			if (data->sesscount >= FASTRPC_MAX_SESSIONS)
>> +				break;
>> +			dup_sess = &data->session[data->sesscount++];
>> +			memcpy(dup_sess, last_sess, sizeof(*dup_sess));
>> +		}
>> +		spin_unlock_irqrestore(&data->lock, flags);
>> +	}
>> +
>>  	return 0;
>>  
>>  err_deregister_fdev:
>>
>> ---
>> base-commit: 97e797263a5e963da3d1e66e743fd518567dfe37
>> change-id: 20260609-dup-sessions-ea2acaac1994
>>
>> Best regards,
> 


