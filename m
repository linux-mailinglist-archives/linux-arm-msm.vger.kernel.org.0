Return-Path: <linux-arm-msm+bounces-112688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ovMiNyODKmr4rQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:42:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6983867084C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:42:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="XOaoIKz/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YxaiEtaz;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112688-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112688-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 904DD307E99A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 09:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 914D83BF673;
	Thu, 11 Jun 2026 09:41:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D9B64A8D
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:41:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781170911; cv=none; b=U0ryicvdLln1VhdIfefS906O5j/sZaO89IyyKRtZTU2Huc4JNc56alP6rdJT+C/viXGvtdkCPYzvykHu6NIAxt5sIvIokhV5zztU2LKIGUBjdwV2KjnXzJFgIwaX2nEIWBcGewdxG5ti1giL8U4IBHLUpIpEnI6dI4GCT0GP7MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781170911; c=relaxed/simple;
	bh=gs29JVYoqBRbD7XbXz5ZIYaa4W+R/0h/qmCJb0z6MrQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kqK+v5olAzcZCZVziEjp8BQT0sVzwofsAKhYXkjZ8befgEv7xtQ/5Lqna0TZ4yoeL8TSJvv/8WfJnWq2z2ig3f/f8HOrMq4VsW7dN9tZ8IWkjPU8mK6kKWuK2nGomqR5IlKA647/mQwxp7rbxI996ooql0gMI1rgCHoEKM8orFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XOaoIKz/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YxaiEtaz; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GKVx2247995
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:41:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OsmgSByejwZrCh97iurQ7ytYSxygMHrNyrSm1o7mkBk=; b=XOaoIKz/3st0iNra
	CAl6ARWxELScvVnNTVf5BCFPIFxcxQ1CLTnDtmQ5kZpmAwJwfDiXhxVm7lmsbucS
	mCNLt0k23ZHwO0NSu5BCP+oqiq9m0t9LoeG8+qHza7uM3//b0SOrCthY9MueQ7gE
	RQaBkcSBkOxUfS3NhAapEABDPg3rXI8nhIQUJ0r+H2owIz4gVNchQZrEA/C3XDQE
	nnaSkzqzfyP8JakXlRW3apcwKENMtuaD0ViwNKi8BarOec0IB6v+vYfwRTb8nrpG
	9jQy2UvZ8MGnQEYuLtox+aBmnii6+cZj0IgLuDRnY961DANiE0bLbjsC7r0KPy4j
	OfXGTg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe79jq36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:41:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9156dc90fdaso189582785a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 02:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781170908; x=1781775708; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OsmgSByejwZrCh97iurQ7ytYSxygMHrNyrSm1o7mkBk=;
        b=YxaiEtazFLmLpCLLdWi7+T2ZQcsN7hOE8zlN1swv+rkzM8FB5txMpo3wW1C7bQli1L
         NNjV9ww47sM2YxLkKUbki/D78ZRx2+MA1a6GUQzm8Lg+6Ip7E+jnmGo77vJJ1ZGfQqj+
         5B1z97tg9KCNkFjGAuX54FkRjbyoAul/alu4vBvwcpQyOfuLiQnzuQ2wIiUGqMIwAI21
         LfqiF31J6cVFJs+m3VCakjGVKNEn4tgNIHCmrjB9cPKb0hOR5KaDwW7be3jzHzfj3QdE
         E+sqk8tKk6mnSd3FLdzop3Nw3/iPDDIMFnJSqj2SBGlFYUeqnbSs/H6NO1ReujLn8YWJ
         byEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781170908; x=1781775708;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OsmgSByejwZrCh97iurQ7ytYSxygMHrNyrSm1o7mkBk=;
        b=JIRX+FFI67P/B4d7S1ZtCN3tyNuBwIeiA9TIQvX14ooD2ln2U6WGbgmwnLLrk+3piJ
         fPfOYotrvkilyIGhlw+Bx09T6pKTtM6NynxUOJXtaW7gE/6n1DnLBVlJ+HAy0LxNQAj8
         fhPj/XxzLjqCuXRgKlpjrHd6qVxD7P5lL3TXT82L/L2MASexCIwmmYORoPGqJ6FOiLGq
         RLtbVp7AG88FnA59OBIP/L6xxSXaYOL3Pq/TwRiuAapfMeJqknbyQ6vyDP9qxkzrbJtL
         EMXYx3CVcvGHfVqNFFU9zNciNUPovRj5gM9dAMOdGnzBbCx5F5Z2wH5Y1bU3Da4463ld
         BSsQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ut3iQ5LeZ86SxxrXJtH5+69GP2FilZmNJDt1OcmXF2mFUDOf0e22akp0resjrWBL0+2p2ojoa02Gh8SUP@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5yccwcHAyt2qOueVtRVyq18vKXqzj7L7S7wn88sweNn1d9QTu
	O4lZa9LlQ3mfnJv6sz+PpZtx19SIvo1F9q5A9U9slvpRAnPl95RDyRje5pVP1Qzr+a3o/7uGV1N
	3s9rXtRUhyMCH5duwjcStbxp4HChshxDov+09g73r1R/aBLkbRRnsdPOTzRV3NkSacQ5Vv2iVN9
	ik
X-Gm-Gg: Acq92OErYZRGZPBW8M/QJAT3/65PjvhRgYL7acOkiLVB2nuG1UFGBAgY+QHUnNffS92
	8Z2KJ7DSunyesxW03V31Zk/bPTgkKKH+ik/R/V75pG5++A9PbcIRiEWrTXdy/Bar6GVrgfTBABP
	75mmWNFdaEUvNLK3f+OVcad/jYZJUXhx0EB/gbI7g8WwS4Fn5P3Pl5lWw19bTbcvRxqgGrqF1Wv
	7XEF+LIOWnPRb41UDRQtB/ZH0zxmg141IZ0sCFNUlB8iIXyllACu2dWgeB73cEY/zauGdkXRDcD
	HzXRUlU43ccYxXcwXT4cs2+iGML/U9sNBKj2duwu/IZSQ498dC8iB4FT+lu714MRv4HYQryuM+A
	O3JGJ85HpC7BVKPj7BIXO3a7RWpOXeu/5V2yi9JPQ7qLNCVZG+ge959+M
X-Received: by 2002:a05:620a:808a:b0:915:4ca0:11f9 with SMTP id af79cd13be357-9160ad70d69mr168816385a.7.1781170907992;
        Thu, 11 Jun 2026 02:41:47 -0700 (PDT)
X-Received: by 2002:a05:620a:808a:b0:915:4ca0:11f9 with SMTP id af79cd13be357-9160ad70d69mr168811885a.7.1781170907097;
        Thu, 11 Jun 2026 02:41:47 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb58cf947sm40282866b.43.2026.06.11.02.41.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 02:41:46 -0700 (PDT)
Message-ID: <b3d7da21-41bf-438b-a305-555730cd8144@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 11:41:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/15] clk: qcom: rpmh: use clk_determine_rate_noop()
To: Brian Masney <bmasney@redhat.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
 <20260505-clk-determine-rate-noop-v3-6-f3f829fbacdf@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260505-clk-determine-rate-noop-v3-6-f3f829fbacdf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VTRugfNWb1-vfltzeLt0mRLdpRCIIo6P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA5NiBTYWx0ZWRfX2qa6MMYiC8tw
 yr+vEbzZHpm7OGDTZ5jxZ53sepNrklX7B2u1ZIxnC6lzGozUgWOdxVWoHTLI05hl2mlfO6AjktV
 5fJS3VcnCwH5XI86/Eb+BH749Hc8baae+LG4PICS5IYOEIFZxhuMhRb1XoRRnmvSJTqz66xQes8
 iCaFWAT0mOI5N7022S2kDOmbk4vmMVrrIH+3nzgGJtG0mEVwii1w06ZPWBeHHSqvggJ+vm9kFPr
 bP8DFaCgHDK3M/Mp/Yne+GHg4cZqcK4PpLnwx/9YC7ozaILqr0t7whfo8tn+7uTdw/F6+Ps8KgV
 ymUsCUGG8HFg7KZxzSOH6rFRH/TEEyOhkj2xrd0odiwmwhXjGW+o9PUjHrD99OJgVBnPqXIJ5JL
 06QXF93CX0/Iphlsp7//VAvNXZjkC2LZo8+Hll05dxhc66K1wob0Xah2ygjr62Dxobsrld3e9Dt
 yZZOfQsLMeDlkNAmUng==
X-Proofpoint-GUID: VTRugfNWb1-vfltzeLt0mRLdpRCIIo6P
X-Authority-Analysis: v=2.4 cv=fbydDUQF c=1 sm=1 tr=0 ts=6a2a82dd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=yiv6Am5jRSTGblAyIcUA:9 a=QEXdDO2ut3YA:10
 a=tYq66TkwoL4A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA5NiBTYWx0ZWRfX01pYFlGJ7S/m
 rdCP/29A8NlDgTmGgeXfrE3rGKrwY3tYTEbwggHtB34JEJeA/ByTp7xJdx8EupO3Gz4n6bLXEhy
 AvORb5AHRoxlKp9N9TiAZ7tpzgI6Rrk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110096
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112688-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:bmasney@redhat.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6983867084C

On 5/6/26 2:49 AM, Brian Masney wrote:
> Drop the driver-specific empty determine_rate() function and use the new
> shared clk_determine_rate_noop() helper.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

