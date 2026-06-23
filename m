Return-Path: <linux-arm-msm+bounces-114157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U5e8EipeOmon7QcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:21:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BD46B6394
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:21:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BsETbVzJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Hapd5/G9";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114157-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114157-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F7AC3002F9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 10:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF2E6215075;
	Tue, 23 Jun 2026 10:16:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15E73603EF
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:16:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209800; cv=none; b=NCqUsjJP3quwsMI9SmHdUQbPtt5Vw2x2UKA8PSznN3/bE9yq4zpUfod7FkRzJIFd1fYEAsjJ30t9wlL6F/XwZcTs5QBo+d3b1Pgoc9qf3GZZ/+BJUNBfTsaRub2Np2XgwTBau73OsR3ILfdmMVDdHMD3dVVf2hdBRncgNIlJD8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209800; c=relaxed/simple;
	bh=YfkPpJdkXtBaCEdQjIlmALxfYu1fB7qBe/0FwrNjx0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jHNCT95RtYrLrxGl9GvmlXb5rNyMWMB/9RkWN6e/7FwoatXCUvf0jMBO84wosp5fGO52VnpaQZRkwkvuZIs6Hc1lDDqu35CChDHzsDF1kcTvwYf0Rq6jheN21qH9dQW30aAqWwRNZTOxJmIq/8FZhnj/CM/eipvBAH4V3QZUsiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BsETbVzJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hapd5/G9; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N8Uuu03243384
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:16:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HqFO2jtpsh6YeyYzgjlFbm8KV7gItqZG0Xm+6T/v/8Y=; b=BsETbVzJx04LEHt8
	xxQCkONflN3uYOXbeXuKG0nDH46bulJe0rBTF2evoQ4cJH6OYggJBmkzzNuij3x5
	ynWn4E0i51Aj5n1hFhMPTiQdrMWJdzPHmcvPNMKDO5ylcjSXFRfpTgl8D1EtO6SF
	SF9T173jXrK1xI6Wv4IeTVyKPyNqE3C+iCtFDUZbG4YPOragWTTbaHjImZrrA0y+
	hyUyc6fSvaqZazjW/Ka2HrPUkwG3wClIlar9CKO7J3NOWqT07aMmsi4MToZU+uZY
	jsOELzYN3ZnKUdTQHOE464+54tklSINHkekFvN2IZlj3K5DyonYsB4g1mqT1Ee9w
	0Rzyew==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyppygfvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 10:16:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915ccc2d4d2so105271585a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 03:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782209798; x=1782814598; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HqFO2jtpsh6YeyYzgjlFbm8KV7gItqZG0Xm+6T/v/8Y=;
        b=Hapd5/G9p6aZWe98864jKwV4HsT284mxKPxoGeXlvdblPPZU6PW/+J7efuwYnorKnL
         HTKUljxY9xFCQzwIN9M9QUNc4jmL0OlqlANdg5miZkVTrUsV+/pXOGpj2njlvXXrV0y5
         daIG2S/ruBn2uCnWScg5BtjM0WfGPKZ1U7z8oElC8na0V57ggP0t1Mx760WPj/XKG8a3
         TBKBcJNWMu41ExwZ7M5d6tx54n6nQq1lhDwkQmJUYwrCTH6JQE94Qj/swPL+kDo8KKSe
         vjQrRic/QsTNpID7dqtQzX8HuGPh4sHcY2kBVZuybKScZuGv1HCQsEy+alkxiOpOKawM
         zChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782209798; x=1782814598;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HqFO2jtpsh6YeyYzgjlFbm8KV7gItqZG0Xm+6T/v/8Y=;
        b=b28//YG2KSSw6LGeQH4AygSqBIrXKbgxuUyQRqFbK92kRzE4TITEMemt2ZFxGkPndC
         yV+wnCoh2C3RY6aw96xlN/8fDEL5y2gF5iov55PL1KFkksgfV+0AuUgkxIddWhAAfKJG
         rRKn9FHz+vmGfdPhYKzhXGul1zCulwC3fUv18YNt3G9KT/gaaEtK90fkYqRJXzWCdiQs
         10T6EOs160Dj6iNGU+LThQZoLJacBVIM+t4hpNH/XELzAUntvt6hbdUY9t7Jr0rY1yyj
         /WOwUd8BKWLR/9LplbRP+DB2XwYWGwp79glj1DZyArqyG5UsstTm/1+jaSd+h/ImLkci
         e37w==
X-Forwarded-Encrypted: i=1; AFNElJ8sVotx+DLSkvMBiXiz0a5i7bkplkD+iwqlhVUF7wzx7aqhoQ2SWXy2sPz6i7oMFYKHPaZoHks51Ztpin50@vger.kernel.org
X-Gm-Message-State: AOJu0YyuTorvrPv/M50CRmKLiqcnss2rOv9/UuREjbsID+FwHmQv5W+N
	YUSKWr285qqjX4gz/twE8BDejhV3diIqTmYARI+HprYRxG2x0GHXXAd9XGnPfdI/iaICLCIN772
	btIhf5VQ0xCbIVmmh0m8mijnRUsLbNPY0Tk+JXYS8INkO3cIN4PVjhwd2CmgjREEATm6A
X-Gm-Gg: AfdE7clEL+o75513RxztB5BLb1mkZLev49de5hZChWFQciFDM5TTEylwSmx16lqwg2+
	JVeRdCTxQ2ahL02E5+BrCoBwKGm6ff670SzPwBo2XRW2xoK+yMHkkSocTIg1SGsl4z1Ff+/Zqa7
	jIkCOmgmNIITBoyPvSFv3UI02Uu4V3Pu26Izb7XMtiuIMOgAFlqOetWt15WRynD7W+cY8/zBtuK
	xClCnzBQunIb0VACcqAK9n36+oi2Y1JXSehyXD6vdDD0FDiXyqGozDA6oDqFCgFAtTicY4Qgegs
	YX6XAPeof0yNJu1xqi3Yaqsk4uOaDIrmA+25Cib7zY3j6C4c/D7JKh9E5IfslBOHEojUS3dq96g
	RhwPBDe6eG0Rz/xygCfJ2Byyojt9k2frYA8w=
X-Received: by 2002:a05:620a:628f:b0:911:295d:59a1 with SMTP id af79cd13be357-925ca2880ebmr420613985a.8.1782209797951;
        Tue, 23 Jun 2026 03:16:37 -0700 (PDT)
X-Received: by 2002:a05:620a:628f:b0:911:295d:59a1 with SMTP id af79cd13be357-925ca2880ebmr420611585a.8.1782209797551;
        Tue, 23 Jun 2026 03:16:37 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e498cedsm486010966b.4.2026.06.23.03.16.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 03:16:36 -0700 (PDT)
Message-ID: <77b8d5ce-0e05-41af-8f04-ea38675bc471@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 12:16:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: qcom: make dwc3_qcom_glue_ops static
To: Ben Dooks <ben.dooks@codethink.co.uk>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260623100000.718126-1-ben.dooks@codethink.co.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623100000.718126-1-ben.dooks@codethink.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4MyBTYWx0ZWRfX3EgAuZboSrFr
 Zsa5fOiIBba5nVSkWe7dYNv91I1kPBOW9Gt19kDKwi4POoOMbZy3YM05oh+SGgah3kqsAzr4I06
 CLPVcYB1hL2VzdWKlRL+E2xC5cxXA6VXjNS2bAOaqnIOQyHlPmLHvgOQLU+M7LwgHh14zvejIF8
 xd2ojv7FyqIu04YbjLFghaOgiqU4G3eT+T83S/NHCYjjh7qG2IDcctNEW2f7VtJKdh+04OcQ540
 x9//BhUQY8/gKQ/R2mpaeVrZzrJtkAwKwbahnm+Mo65zeJSVSsttZI9qvmcIsmKhu+IgMfwQQuD
 FwEVBdqd7Ph+Lpbc96hEEyzizOcoHk/ARN4R9yxkmkgyT0RU+lzv/cKIQZRiGwrUo2CywZ1O+iu
 SWqvSP1a5uN3ksCxxoAVHG4iOAZVzR+mjxWHbVnrjWVhfQmnLzzfwn4YgyVkHPDqH20SsEl2lkS
 oWzPMtgSrUHl1lqAvIg==
X-Proofpoint-GUID: 4185nXj7xvPe2Zgh2LpSNZbEKcvaDxWY
X-Authority-Analysis: v=2.4 cv=dvfrzVg4 c=1 sm=1 tr=0 ts=6a3a5d06 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=1EsaE_6oAAAA:8 a=EUspDBNiAAAA:8 a=wVS3_rNZUYXMhOvZQHMA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=3ZumFrijQQ-2J9H5h8ct:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4MyBTYWx0ZWRfX1cMNQ31LB4mf
 1HUAlkMg+0P/mSqhaViWgkjdr3ZRMptehoFmfQaDVq/DWDWboSaqLdrMGkQqRgmql6MIUp4H8J3
 GpQsNbSa1oavivZWUcw7T9XHSt+yj/8=
X-Proofpoint-ORIG-GUID: 4185nXj7xvPe2Zgh2LpSNZbEKcvaDxWY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114157-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ben.dooks@codethink.co.uk,m:Thinh.Nguyen@synopsys.com,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,codethink.co.uk:email,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 94BD46B6394

On 6/23/26 12:00 PM, Ben Dooks wrote:
> The dwc3_qcom_glue_ops is not used outside of the file it is declared in
> , so make it static to avoid the following warning:

Odd to begin a line with a comma> 
> drivers/usb/dwc3/dwc3-qcom.c:605:22: warning: symbol 'dwc3_qcom_glue_ops' was not declared. Should it be static?
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---

for the change:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

