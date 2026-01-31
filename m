Return-Path: <linux-arm-msm+bounces-91350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ye3hCNWwfWnoTAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 08:35:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCB2C1165
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 08:35:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 403D5300AC39
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 07:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFC6930AACA;
	Sat, 31 Jan 2026 07:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gZOY13HI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iEsvYsz8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B86221264
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 07:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769844945; cv=none; b=BXaFuJVx//G3TOMfz55KStt2F0f/2VnuXMr2RetntRtRipRPrVvCCLzNdB1rwNxdPqnbf8eHcVipvSZipkmRwHFNJJ9N5TKqNg1zK9Kp8niSYx1pOoflUn3+Hxs13aB84v2dwm/7tC0w1Q5gOZZNllbc465v3ZYTVUxz9e5r858=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769844945; c=relaxed/simple;
	bh=hvVnxPOrZIbUtHJz7oves9pDbzDR3Que2PqHawVoVZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ujmYRRSLYhdqW/lkV8U1SNnln//faMbBIebRkOafCYist7PWils3Aa8oQ6s1uAyxDjVQfYCE3ku3Lt6PLb5Fx640MIyAZE6tWHuv/e1Zm3elMlCQyCHb4u46D7BmkH036+8pog3kCmOOCkaJa/ZqIvuIVDlCqJ3O/vlhnXSKBPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gZOY13HI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iEsvYsz8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4blht1061502
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 07:35:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SUqzqLvgto+ebNJM8P3jaMfV
	gKVElHQyD3m2HQJHmkE=; b=gZOY13HIhKlknlRFc9Py5Rje7e39U5LQJNlrToYk
	CXPQ7X6R3U7Fz4kGIZA2tOuFK22bmJXk7ebGs7beGLx/iieBEP6KNBYU2SaJiPB8
	OL9peJSU09SDGH52fQf8OVJxjVyk9G6QXKo5GLWyYNqE5iz5kUlmkT/3hUF372u1
	4Cj3/cA2EUUaMJO74sCgRbj+bHXBtlD34i3kurF22P/e1Z11wKV/Arjo3a+FdVkJ
	qmPflA7Vvjx7wR7lBxd1HbOX86tIgNDi22ja+7+7aqvjnD+bok6tpFeevwhy6y4+
	O+oUg+H48hfnfuWv9t9AH2vbE7CbR83HxnH8ylowRpa+9A==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1avngc7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 07:35:43 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-948378f5fe2so8028739241.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 23:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769844943; x=1770449743; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SUqzqLvgto+ebNJM8P3jaMfVgKVElHQyD3m2HQJHmkE=;
        b=iEsvYsz80K+q5GtHtWHWmFCCekriSgW1/ff0sIjMmbM+G2pYdkVrwHTic4LuIg1JGC
         zP3sLSkHVtextlPsex5+vAAITO657+Eho22Kir0D303gRIx/Gv1SVJeYn2ARgi6+Kn+4
         Ri6pXKePT33wnXIxKY3uFoeH7ua8i/X23F71eSUOAVm1LFJ++8jtWl0zmtpAUa4/IS4y
         HMc6wHY5JME5wJWGJOhukTIhkz4s/QGHsOyFM9hSAq/yOR5kx7KNqN5OyLPVIupA92fn
         YEhgIxhjQNp/3iQclts0jxiQvza0dQRyUa1vjN5Eg8i+kj/qTOOF53CPnANNhXOY9qg3
         H+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769844943; x=1770449743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SUqzqLvgto+ebNJM8P3jaMfVgKVElHQyD3m2HQJHmkE=;
        b=X7uYkWMX18s6//PN+Z5cgAzdrKRKohjnnXP1I0ncw/ew1k65vm+si3YpXyuBkiOdnm
         cW5PEA1iFS4eDyRocZirXEAgAUQii24BAP/c7j6Rj+PGYyFIUxDM1BR+FPXbnpI3VvNK
         ZdW6rLXqiFdNIcwRc3oYZaXaayLitWHBjDMZuqM+F6LdFJ+Y9C0KWk0+N12ixqvhN5Yy
         cRGGMI+razAg6EaF5oW6+r1B6cngUyA6Io7lp/eu0KWv9JPN84gB858/SM2HPtNLFQ2a
         PG0xWm8zd5xalWu8ISd7RpTETP3FJLcevzyBfVFrK/Fi/8aNpB9RYYsRetnWzDgSemNj
         R1jw==
X-Forwarded-Encrypted: i=1; AJvYcCWxRMnMi+lOHwvW2Z6WvZuTTVn/Syda2eN28sz26ipQY2UemM2YyQjAV9ekvKO+0gFai4HXOnfNsdQSO7wm@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn/xAmn856YVHVPHkCHC4YJnr4Ltu2M7jLTlNSgOpm+gxfxEzN
	IJi7w872CLbo8l3wSUCnDuzdbvZ8ffXMe0Q0hQmxYQ2TakGHIZcD1L2eNyCUwev9B5WvqIphVMB
	aren4uKpwG4AxQ7xwd+tbqiC/me0/Rdbf1TX9cvXGgWxZJkT67ZCgoXWfowtgC3BylkZh
X-Gm-Gg: AZuq6aIyVydCasrBAzGLGtXQPYyuQeJdTXjGaMrROdUojIuae5lU4kgm5thVhoaRH7M
	YKtTI9dOPzAzhkiEAz12Hl7KeByx+vpqL2xRY0NOkyP55tt2SViLiLrsE9sVfXePiiIJ+XMNpEy
	NyLz7JO3rGewxIQuo+rFh3Z+i1ANQJWS9T2WV2PbwIuzdnMhy7qE1V2yXxrk6cyqFTKrHkiF3j9
	jkjjzyET4fgBWle4X7QKSAmDzR5ZZj/5CeBG9oWl9hNq0u9ranTcKqe2xEuKhUbYBOLg+pWv4lV
	704V0qQrYZ6f6aD5BYPLRdQCrjHItwXfBtl3kAOIxS+6RmXV8t9L7rkpzRBocLoNAAVuc5AoFZ/
	0zlGaYn9Tlgq01Abv+0Agk3tznRKM0loBYphzpmWyPUt9EEjZTPaCisyxeAvTZ0stxTwNkphURb
	0p20FsUgHBCkDqOK+7EazuiPQ=
X-Received: by 2002:a05:6102:d87:b0:5f5:3c96:983f with SMTP id ada2fe7eead31-5f8e236d78emr1957069137.1.1769844942948;
        Fri, 30 Jan 2026 23:35:42 -0800 (PST)
X-Received: by 2002:a05:6102:d87:b0:5f5:3c96:983f with SMTP id ada2fe7eead31-5f8e236d78emr1957059137.1.1769844942560;
        Fri, 30 Jan 2026 23:35:42 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074beadcsm2216555e87.95.2026.01.30.23.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 23:35:40 -0800 (PST)
Date: Sat, 31 Jan 2026 09:35:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xingjing Deng <micro6947@gmail.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xingjing Deng <xjdeng@buaa.edu.cn>, stable@vger.kernel.org
Subject: Re: [PATCH v8] misc: fastrpc: check qcom_scm_assign_mem() return in
 rpmsg_probe
Message-ID: <f5p4fdxannhvqmbwj3e45rnoew4vcs5cczlf54honfqpotkxen@4f7hqhexcrin>
References: <20260131065539.2124047-1-xjdeng@buaa.edu.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260131065539.2124047-1-xjdeng@buaa.edu.cn>
X-Proofpoint-ORIG-GUID: 0LPpwoL9ydvsMJ56Y5sYkqgBiBV2trXH
X-Authority-Analysis: v=2.4 cv=bPMb4f+Z c=1 sm=1 tr=0 ts=697db0cf cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gt7TBnWFjOhXHAj3EKgA:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: 0LPpwoL9ydvsMJ56Y5sYkqgBiBV2trXH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDA2MiBTYWx0ZWRfX2PIzhsWEVSsM
 7urv9Lg6RfZF+UIsj6AtlNMuNm+fY4DjtkcxlxE1qr8nYgOxJHdvNse51vNYXObylTIDA8zxqKS
 DEiR3Usvr6r875uTcJK7kSgTuU3BV7cfVrgRnkmLvcRetNem9k8c1/QvnAdfkdMIEcdjvrF5r87
 HYyD4RVZilSa/DGidstvNs7t4zhmpdhTCbX7IrRmkWAhhioRKRho1QLaHe8EmsHK7PU5iW4wGn9
 hjWr4ixvGlfgl+JFN4fyppzLwo2zdA7olhm7Zpota4dzaPVygpb3bmfRyD/Fr8oIztuP+GWaqTF
 ByzzT7kXBP0XfINw+ylwMNZ7ivctV96TTnTWSOwXlizUJFS53Rm7KkPv4Tjch7SPfvjvfeXeavl
 gFsDVcM1zfI2azenZM27XQjswaOfBrfJg2Hkm+HF/maca8VtQvpgb/70bSJZvJBonIQzP7vgZsz
 2qLB8emJzkpV1Y793OA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601310062
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91350-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,buaa.edu.cn:email];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6DCB2C1165
X-Rspamd-Action: no action

On Sat, Jan 31, 2026 at 02:55:39PM +0800, Xingjing Deng wrote:
> In the SDSP probe path, qcom_scm_assign_mem() is used to assign the
> reserved memory to the configured VMIDs, but its return value was not checked.
> 
> Fail the probe if the SCM call fails to avoid continuing with an
> unexpected/incorrect memory permission configuration.
> 
> This issue was found by an in-house analysis workflow that extracts AST-based
> information and runs static checks, with LLM assistance for triage, and was
> confirmed by manual code review.
> No hardware testing was performed.
> 
> Fixes: c3c0363bc72d4 ("misc: fastrpc: support complete DMA pool access to the DSP")
> Cc: stable@vger.kernel.org # 6.11-rc1
> Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
> ---
> v8:
> - Remove the redundant brace.
> - Link to v7: https://lore.kernel.org/linux-arm-msm/20260129233703.407404-1-xjdeng@buaa.edu.cn/
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

