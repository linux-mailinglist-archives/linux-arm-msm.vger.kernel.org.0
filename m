Return-Path: <linux-arm-msm+bounces-92910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGabKDrhkmknzgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 10:19:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF5D141EAE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 10:19:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D7DCA3004F4F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 09:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EF6B28489E;
	Mon, 16 Feb 2026 09:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W2Jbtz7f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FcIlYnMd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9441EDA2B
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 09:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771233586; cv=none; b=F6pFGXkailPV1wdvJO7F1qx17/CGG1XXiHOqNq7SocByjDJRQJ7KK61f0oB7iZu7ePswlnlosO0K3jlJYhLaWV0V20SGEF6xhC5cGrOM39UhBJZXTQ7nuTpSnoBRFyVg51FRUPom3acKBFbDUxImhrVF+Pftd2tioRampwwqQ1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771233586; c=relaxed/simple;
	bh=ds3kaq55INpUUsWp0M3gKTb0ufF0zSpdXuxn7IiKxsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WQiPrl8ftNXTY/By9KTqQyGSHHr603RqM1uCchIf4o3CQRDlr3gr6Q66N7LVXoJkGRsvqqa/MJwghpHodJwDfmwYtcH6MF2dcs2sSqcLQgfxpaMuImRRc1bk8l8Fs81hKPKB/7eRolzZEXqQglTukKnThWbHfRABb4v69v5sjJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W2Jbtz7f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FcIlYnMd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61FNHi2R2431215
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 09:19:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	298888CzSuRcDROwfpg8wrkYvJ5FY1wrQe7Pkk8ZsJA=; b=W2Jbtz7f1liI/dff
	9s3kW2twB3VTK2IQzUwqWJWHYBnSt5mEdYv1F2IFbPXcO24GbuhL9WJiquSr65w3
	P9sYefymFtKe/ruGbw8WZTkf1dakgtlTRH/fvpctTmz0zxtPtriT/JDvcbNi6MAP
	PC3M2m7SOjGmurHjeMzC8c0hNLP4TyuNRbdBG4HPDYrRIeP+1DuQEumQwxpjg5dQ
	gD/njKbsA6/fAgLAerTxUueckJZbEKDDocfZS3Bz8NNf9osn48nlkTbD1dijJDfk
	zwX8z2YFyBLRMQlKnVP13/WklV2xaUZu3ZxhsH+/blXoxhpz4QMi40A7KkecFHm1
	haVW9Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cahe6404e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 09:19:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ab4de9580dso155630705ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 01:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771233583; x=1771838383; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=298888CzSuRcDROwfpg8wrkYvJ5FY1wrQe7Pkk8ZsJA=;
        b=FcIlYnMd8+wX1p0kEDI/6uk4dgQJiNWwqv+iuwbKUTCM2Z35SbgrnrdAw1iB3d1G+/
         a9BYT8Oxilc3aKzbb0K8bd2GzW33AG92TFSNAwuV7+CZd8rotbh8hMU4kwODBv2YtGIY
         4qMKmMcLiAumtFLChyUpFf3ZJi5rYZsXnySjPp+Z8yoc0N4vPomotFP31dqFfL5tHo5I
         Wit0IDPsLFMfYf4uV5AbSbpzKvN5mpMeY843kh6zl4wTs5wH24zQFvHLgeXF4nhHUqT4
         Li2VotG7DnOZXt/A8bbtLUP1DFKwshoHMAxru1N9eEV43gyj3YlV1xeZ4TD/mhslEuSq
         dphQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771233583; x=1771838383;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=298888CzSuRcDROwfpg8wrkYvJ5FY1wrQe7Pkk8ZsJA=;
        b=ZaIXKqX0H0VkA0EJYRmtGyT7YE2V/TgS7xzRYL3WBJjH95pTx0zZKzgeNFQRK5czEn
         S9Uv0Ty/6WkM6vN/MIgR/Zh7DefIe0o97CNu6eH2rqUV/hHxd+MUvUzcFAg6nAfNTlwe
         PlTb4pD18k8rThGEt3zP5pSjlJxly1tUw8mZF5XAL/nKbhcn3MT14VBgy2BEuB6Y4Rm7
         XsZx0Q1nvBmhRcKFZS5ppJ8WHZDIUPLRtoR4J4UYa/PvoeebBgr803Cx9uVXVw6hkrTD
         71QQQ+6PdnihDItT25/8m+RS8LDGwmlOGq/HPDUJUz3ui6xJV/b9gjNxk1GLcpmGPSwp
         nxXA==
X-Forwarded-Encrypted: i=1; AJvYcCU0kE6Y59n+816uJVLyE23Co+wxL/0A9rvZm/8lWS0Hwz5GshN1wO7NMA+oAyuImMtILgLp1gQlHxkNNrMW@vger.kernel.org
X-Gm-Message-State: AOJu0YyWGdRbo7X+1nPRplbFgISio70gGYRL4Fj4zNWxxvKQ9WIQnh1J
	wNzhlMTFuhGaVyTobdUCaSkPvTXpyDOYzrEN2Si0pAi0oTQhYncIlUA+YanmR+d0iB/nWVvCYoC
	GFlbCXZ2sE+NczmUHGNSLZkulv8NAJeDy1Ku9ehZHs9ki/KiYrGGfB0G6C5cj7OTAvME6
X-Gm-Gg: AZuq6aJc/WqpOzP6XZxPsqY4KMtmEQbKm20NNQtWq+hdxPUpA5dKXvd/PDos1RUCioy
	sJxlQeh/7+S2UPfJjpqLak9FueOBZikxD2KaBkltqxuqc0vuhrIDXF0ksdhvbGwkO9o5zGiJKzL
	W/hPrRT2d8/tvKoQ3Vi/8oVgTiz2kLqoFTQ+t0b2ACeQEs7I/5HsWniyUwFIoS8wh/gBK8Lip/G
	WWu5TrifjtywK9e8f5TVoAElShFAqUh8AZvLt6sKUYm5+5yI/YJcgtxf8PUk2cVu5aPfdGd2wuy
	asQbuF0sxCPbWhKAJZ0JCoVbnzs3lVffolKWoxrfR2KholEUzIvrXO7kg0cl4JTH7NITapoL8IW
	MtEDxTT4mZfmHJPXmugj7vWmcy21ge44qX2BXZW/C7Ju6N3pZrQ==
X-Received: by 2002:a17:902:cf10:b0:2a7:b447:3389 with SMTP id d9443c01a7336-2ad17433847mr76919715ad.2.1771233582987;
        Mon, 16 Feb 2026 01:19:42 -0800 (PST)
X-Received: by 2002:a17:902:cf10:b0:2a7:b447:3389 with SMTP id d9443c01a7336-2ad17433847mr76919445ad.2.1771233582469;
        Mon, 16 Feb 2026 01:19:42 -0800 (PST)
Received: from [10.206.99.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d624esm60409685ad.49.2026.02.16.01.19.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 01:19:41 -0800 (PST)
Message-ID: <9e0effb8-5e20-4f37-a745-9afe55375238@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 14:49:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] misc: fastrpc: Move fdlist to invoke context
 structure
To: Bjorn Andersson <andersson@kernel.org>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com
References: <20260215182136.3995111-1-ekansh.gupta@oss.qualcomm.com>
 <20260215182136.3995111-2-ekansh.gupta@oss.qualcomm.com>
 <uzhuta6ukkf5k3za6kzf24zsf6nwvneyrlaezte6z42ggok56w@nd4cdiqizld2>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <uzhuta6ukkf5k3za6kzf24zsf6nwvneyrlaezte6z42ggok56w@nd4cdiqizld2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c5WmgB9l c=1 sm=1 tr=0 ts=6992e130 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=9sCCoSkNH54s9k6pYwAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: l7jfsQZYhSXjFJKMHDtgAlsT0Goug5u1
X-Proofpoint-ORIG-GUID: l7jfsQZYhSXjFJKMHDtgAlsT0Goug5u1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA3NyBTYWx0ZWRfX8IGNPq54emt1
 RgHI+rUlkEBOUh6TOLjYjSuVXMjTpO4aY2rickcUmvQA9bDi6Mn/cQmgdqdNYmqNIjXri8CpVH/
 GaqilGPGiwdz2t+Jg3IcwZyl+XO3O1i2Kp8SHCiid8f+uAqRmS/UWnC2HOx3kJui/YmDg84gAC2
 Ruz6lGrqxW+lPPDtAhLX/MzeRr6iDS8HrabrxeaO3p94glgVO07AM0vLlCFsNrE7yMflu+0qczy
 z3b9jzn2O2gXKlcg9xRhUNij1wmrxrN4Ea5ynwtg9JZWQbWd1mWANztKp8mcnBP7fK826zGgmaw
 EUCCwEFPqXVel8zn9WEsKQ063Dw3N8NcdikQR2UUP63GLho/v6x84IDiT4YHZgrMLzn//u60qKR
 OBKmd7KV4XC68D2h9Ak/dxrSyu6Acx+oqK2XnmvdXdLBOoR9lShdwwMOHcAXiUt4KSpQLCi0NH4
 d5TvHINHVQ3n10S7QZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_03,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160077
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-92910-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1FF5D141EAE
X-Rspamd-Action: no action



On 2/16/2026 9:26 AM, Bjorn Andersson wrote:
> On Sun, Feb 15, 2026 at 11:51:32PM +0530, Ekansh Gupta wrote:
>> The fdlist is currently part of the meta buffer,
> Do you mean "already part of"?
yes.
>
>> computed during
>> put_args.
> The only "computation" I can see wrt fdlist in fastrpc_put_args() is
> where we calculate it to be at pages + inbufs + outbufs + handles.
>
> So, why do you say that the content of the meta buffer is calculated
> there? Did you mean fastrpc_get_args()?
The fdlist is updated by DSP. By "computation", I meant getting the location of fdlist
in metadata buffer.

fastrpc_get_args allocates metadata buffer, fdlist is at some offset in this buffer. This
list is updated by the DSP and rechecked during fastrpc_put_args for any entries.
>
> PS. Use full function names and suffix them with (), to be clear in your
> description.
Ack.
>
>> This leads to code duplication when preparing and reading
>> critical meta buffer contents used by the FastRPC driver.
> "used by the whole entire FastRPC driver" is rather broad... 
>
> As far as I can tell, the thing this patch is doing is caching the
> "fdlist" address, to avoid having to derive "pages" (and thereby
> indirectly "list"), "outbufs", "handles", and then sum these up.
>
>> Move fdlist to the invoke context structure to improve maintainability
>> and reduce redundancy. This centralizes its handling and simplifies
>> meta buffer preparation and reading logic.
> I think the patch looks good, but your commit message is too high-level
> sales pitch.
>
> Describe the specific problem that you're solving (i.e. you're
> recalculating the offset which was known at the time of
> fastrpc_get_args()) and leave it at that.
I see the problem with the commit text. Let me come with a better description.
>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/misc/fastrpc.c | 16 +++++-----------
>>  1 file changed, 5 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 4f5a79c50f58..ce397c687161 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -233,6 +233,7 @@ struct fastrpc_invoke_ctx {
>>  	int pid;
>>  	int client_id;
>>  	u32 sc;
>> +	u64 *fdlist;
>>  	u32 *crc;
>>  	u64 ctxid;
>>  	u64 msg_sz;
>> @@ -1018,6 +1019,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
>>  	rpra = ctx->buf->virt;
>>  	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
>>  	pages = fastrpc_phy_page_start(list, ctx->nscalars);
>> +	ctx->fdlist = (u64 *)(pages + ctx->nscalars);
>>  	args = (uintptr_t)ctx->buf->virt + metalen;
>>  	rlen = pkt_size - metalen;
>>  	ctx->rpra = rpra;
>> @@ -1120,18 +1122,10 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
>>  	union fastrpc_remote_arg *rpra = ctx->rpra;
>>  	struct fastrpc_user *fl = ctx->fl;
>>  	struct fastrpc_map *mmap = NULL;
>> -	struct fastrpc_invoke_buf *list;
>> -	struct fastrpc_phy_page *pages;
>> -	u64 *fdlist;
>> -	int i, inbufs, outbufs, handles;
>> +	int i, inbufs;
>>  	int ret = 0;
>>  
>>  	inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
>> -	outbufs = REMOTE_SCALARS_OUTBUFS(ctx->sc);
>> -	handles = REMOTE_SCALARS_INHANDLES(ctx->sc) + REMOTE_SCALARS_OUTHANDLES(ctx->sc);
>> -	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
>> -	pages = fastrpc_phy_page_start(list, ctx->nscalars);
>> -	fdlist = (uint64_t *)(pages + inbufs + outbufs + handles);
>>  
>>  	for (i = inbufs; i < ctx->nbufs; ++i) {
>>  		if (!ctx->maps[i]) {
>> @@ -1153,9 +1147,9 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
>>  cleanup_fdlist:
>>  	/* Clean up fdlist which is updated by DSP */
>>  	for (i = 0; i < FASTRPC_MAX_FDLIST; i++) {
>> -		if (!fdlist[i])
>> +		if (!ctx->fdlist[i])
> It wouldn't hurt to keep the local fdlist variable, keeps the code less
> noisy - and you don't need to change these two places.
Ack.
>
>>  			break;
>> -		if (!fastrpc_map_lookup(fl, (int)fdlist[i], &mmap))
>> +		if (!fastrpc_map_lookup(fl, (int)ctx->fdlist[i], &mmap))
> Why are the fds stored as u64 in the metadata? Are the actual fd numbers
> somehow consumed by the DSP side?
DSP uses it for book-keeping mostly for maintaining DSP side mapping based on fd.

Thanks for spending time on reviewing this change. I'll fix your concerns in the next spin.

//Ekansh
>
> Regards,
> Bjorn
>
>>  			fastrpc_map_put(mmap);
>>  	}
>>  
>> -- 
>> 2.34.1
>>
>>


