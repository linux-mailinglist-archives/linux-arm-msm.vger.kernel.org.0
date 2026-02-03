Return-Path: <linux-arm-msm+bounces-91676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHBSHVfugWlAMwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 13:47:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3260D9443
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 13:47:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6363F310EFDF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 12:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94FC4344D9E;
	Tue,  3 Feb 2026 12:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DTPoO+Ch";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RpyqvMO+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC667344D82
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 12:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770122534; cv=none; b=LbxiVmri5NdNIAB+ObQnJ1HFtsHVPG+Ir6ZwogQWLNfNhVamydS0q/zRSviJVK8CanlaV2LlKvZKgGD1A3e0RzA+80nOWWN37Tx5Oq/xQpPkog0rz2b15rLmlb+WD4Y/LsFFenYNdK8fHy3V+mRMAlBD7cl1ZcpjZN1thLIMYHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770122534; c=relaxed/simple;
	bh=mWf04EejGF7lxKeFxdD9niBwwAGB/bVCPVvzwJS3+1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ns7/o/UXDndX72a1kWANF+26IKJJXzGU0/+uLVwkdh+piTcCcimQkCq4kweXytI/RtSJhVuvQkRC/boiwfP/A5Yjb8grzBUAPnEMuhgovwAmvSDEh9eK5uA6k6jw/KD9GPZK+0JSytQrCuErC0a5Jpyn8ejAlmPXA2raEr4Xzi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DTPoO+Ch; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RpyqvMO+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613BlCo12417890
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 12:42:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eZvrkwQEXiEXdBgr35BOBP0tSrpKt1YrDMAKUpeIWUo=; b=DTPoO+ChJ8p2Nu8r
	tlfwiyV42JhzbcllKquQHBpxU7vf7q2WTjGWVoEMhQ0iccAgRw6GCPHovbLud23B
	t9dlAN0x+j+J7Y+NO9P6DwYrCOTeBd125K7A6oYKwe9p+ebkNO+MBWwycD7V7kGc
	32ncM02k48a99S3Rbjohv8zm74wYexJF7DC6XqETwxVQ4T+KQrHnfiLa0y527VlN
	FpauiFs5nFoLhGwXoWEQETtqIuq8XDeREurRpKJ9OLhzJcaeM6XiEbWifl+W64Yx
	CVKkDQMvFzMJ9IYXgHh+iopmnA3dBphXtwJ8WsozwM3/hyV3vahKdG/ZnN6qD4U5
	qk1Zcw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3gew84q1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 12:42:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c709a3a56dso135352685a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 04:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770122531; x=1770727331; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eZvrkwQEXiEXdBgr35BOBP0tSrpKt1YrDMAKUpeIWUo=;
        b=RpyqvMO+c6e0YuyHLW01ipSGAZkDs7qT3ysdWHRv7F8O8RxdyNA9JrNXACH28qNnwH
         eQfWY6TDPP8FAR7ScVQExZz5l4lqJFaGRIgSJJAN7VH3U8VBk0nESxJhKGfqHAR26U+i
         fR7EGXQlR67x2fElTwv7FU1S9wtxefdUXyaETwB1iVbpV7CRzrGNPRiwk3K2Nysa71ZA
         LNjBxuabBda95ChveBMgDJ9hxKIGtMcsyy5h2qxvJkNsTpRx3jKVNTX5hgcNIzK7Zc2z
         u4oMnweWvJ72iaiuEh9/zBcoW0KOQO9h6B0IW3xB1nlGVsENFZY1zYpAsVL5mkmxxZAq
         PyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770122531; x=1770727331;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eZvrkwQEXiEXdBgr35BOBP0tSrpKt1YrDMAKUpeIWUo=;
        b=FivXkFJnG+A8Pt+GeUpmHiu+vC9GKLU/3cHxg3TToECIA05LN2sQEBHNySXFQ7JsJx
         kZa5fKjL18e9vQ5NaJXegSUB3NeW8yf8hxAv7YzmSuDsFxKqWcoBa4hvyR/otbaNruHK
         AolxNS70zK3CcvT3KZ5SpLqbpLFFJNi9zX6Lkme+3lW3WU6f5ZL1VLp5LOZ2+p+c9sXd
         oZEN3eWmIGoA+HN51WJH0006aHkJcluEDthumfjptTHThCbjW3h7lxPsJ/BwrJYYOgsJ
         rL5TRd2LtM/6CotfY1Cen4SLpzkiPiDQKEgryPrfZdeTD8siRAdLsM5BL098kuOswfr6
         LkSA==
X-Forwarded-Encrypted: i=1; AJvYcCX7T0egMddEkM15rfnITulFCaHmqt53tk1v+vAuF7mbB97L3kmF8fabV/UoYIn32LKKx7p5Qdbsj3GjDAyH@vger.kernel.org
X-Gm-Message-State: AOJu0YwN3j3l8QfQOe1XV0dbXcj2yEr0BkFaGRdVzBMRzCzket/uY3OO
	wxCD4N5Vm7ek/fIhcjoHMALhkddwrPdTDQ7afxUwcUIszdrb9X7p9RfCmD+xl2vmg3rY716TQdt
	3f0ULymFYHgMAW5N43nbkFx4NSzjP9NkSvJz0TOzsenTN9ALBTf4H6bVk8jj0hCR0zRGZ
X-Gm-Gg: AZuq6aIoszK7EaReIZeWKYjmfauIBAUZYANe+E70jq1209XUgFDzMOYiMXLF5dDNs5s
	1QBRLa0sjpqlKNt5MZl2G0rLSAYHbPQIHDN2UHskt1w03KL17LM6w329dLQDxSDVXxCC//CJxAH
	vET/bYwWGe9bb8cjV6WXnY4c3B2pFarwoQ4s2QCZ24tCVqGFX+DOzquDkxf4B5SBwbZlR2XqXd+
	7ju4JgxPDZNshS2x7jSvuA/Be/jw+aXiM13/8KzXNcabbRldTqBwI1Jt+AiSpF6K9BxcWH2yQZ9
	dbXdO7alsOce5s2FzgM5hmE0O24AkgTwo80Gkz/96s4UYMlAIJglp/rS3vhFfKyd8Rh+fG+7bze
	CKbok3fJ+C5tLR5cLe3Sv2RLfheN/AARwvKHcNkTArpzo0hFVqDWsbgSHCmGcIymn6JI=
X-Received: by 2002:a05:620a:28d0:b0:8c7:1af8:4ea0 with SMTP id af79cd13be357-8c9eb2ecf59mr1438349285a.6.1770122531242;
        Tue, 03 Feb 2026 04:42:11 -0800 (PST)
X-Received: by 2002:a05:620a:28d0:b0:8c7:1af8:4ea0 with SMTP id af79cd13be357-8c9eb2ecf59mr1438345585a.6.1770122530750;
        Tue, 03 Feb 2026 04:42:10 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1baa42sm1039773666b.46.2026.02.03.04.42.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 04:42:10 -0800 (PST)
Message-ID: <a0b505e2-cc0f-43e4-879c-88451114bccb@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 13:42:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/13] i2c: qcom-geni: Isolate serial engine setup
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com
References: <20260202180922.1692428-1-praveen.talari@oss.qualcomm.com>
 <20260202180922.1692428-10-praveen.talari@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260202180922.1692428-10-praveen.talari@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0wRP4r841ok2V4Kjd1Bb1JpG5ZeJKgE8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDEwMSBTYWx0ZWRfXzcrUsfRX8uxM
 mE2wexHLqBXY8l+cWiWVmBGc1RZi4F/YX5zUzN9AqdT4L30K5XBqE3bc0MK5JRPm6eyi+xv5Gpd
 IA1yLIWHvTXWfF8K2APeXX2OrDpctmVgos8VbFkbrorwE1glI14U37CRH+/ezjf1A9Un8V1isqi
 vyXvaDH3gXlP5uLVSuAnoyVz0vVALKpRFBiwL7626RxOuAa1zqh9Il2hDLRiUVXQBPCvCwVWUyX
 FWpKzVRsqrIXwI5EklSHtGkLvZU1BfGE8r1wlalZFwnRt7Ey3zZiE0rT95c3nqxmYPnaPwsG2dK
 dJZLx2uQqwT9wSddQBDL388Cqv3Jwn5mxL4MHY8itBJrii/Qkm8qHED3/Taapr3opTkCGjdYhj6
 z3fIWYTsE9/EW+vUw4YiMiFiAC5hTOhp08KG56I7+QaBTzjJtgcozZXSNKXcaTYjwDZfzFTkLS0
 CScwG85hW8wLvocwoww==
X-Authority-Analysis: v=2.4 cv=XI89iAhE c=1 sm=1 tr=0 ts=6981ed23 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=3uQcbjdxft5aBLpoArUA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 0wRP4r841ok2V4Kjd1Bb1JpG5ZeJKgE8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_04,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030101
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-91676-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D3260D9443
X-Rspamd-Action: no action

On 2/2/26 7:09 PM, Praveen Talari wrote:
> Moving the serial engine setup to geni_i2c_init() API for a cleaner
> probe function and utilizes the PM runtime API to control resources
> instead of direct clock-related APIs for better resource management.
> 
> Enables reusability of the serial engine initialization like
> hibernation and deep sleep features where hardware context is lost.
> 
> Acked-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

