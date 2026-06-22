Return-Path: <linux-arm-msm+bounces-114041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SwbIKsJROWomqgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 17:16:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BEB6B0A33
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 17:16:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EOCmz3Hp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QFInNeT6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114041-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114041-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3402C30465D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 15:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F299533121C;
	Mon, 22 Jun 2026 15:13:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5611330B15
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 15:13:03 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782141184; cv=pass; b=BCz2mouUvtedY/+AoTI3QbSm4ksrRFnuGaCuOy2S6AKSqw2ZLfcKhEwGCwqayUE4HGCwdNGNJX6mobGHJd9x0fX6kBp6wzLuVAXBvTZoSzqKzpLqxBPEoOr+Z+sAsU3g11mVa7T9zDT2tdtlljjepZ0jGDt2dVbFepemha2luas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782141184; c=relaxed/simple;
	bh=jnnOTP98RJSIabIVnaNQSG6Q60LW9M63DltF5shduyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P+z3wbEb3eABL/KJkkxc+f5J890JjI0fkVjiljADJPc5iM0lQz39i9zM0C7tKQzrglFFMhencuJ1pOGM+QmAKMKisjacj7zEwCMRfIkyZPfCONeV/VjENU7K2envYTLl42PoB/LGbgnmA/Bt7EKcmxB8L3NqDY3MKSnz8DgtkUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EOCmz3Hp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QFInNeT6; arc=pass smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MDFcoh773334
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 15:13:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p5YHH1cPRNvLPXQXevUlrGJm
	18UVfu7zN2fXkcwzJwM=; b=EOCmz3Hp6PTVojOiJ1lRZkNJuHYUT07OYy5kVE63
	Ro2cAkN/StUFvMaVmbEz74IduofCSrfTLC8MFWuaYti7+h9oZ2A1YiPIuncD6Mxc
	HnvwrSMu9UgAYeablvF5k5tsCFHvh3zRgYp8Eo9gFfgoYzx/yS/W2ferydWAb8eK
	X5jaPGe5ow8qnM9vYHKFEx5gxSBRK9YHqoAU2vEOam348mEbFPGAvFYSbNZPY50b
	WJxF8CN7kN1BUXkkWxYEJXdPqyX8O86X0Z+b24gSXwg/t/j0B2enpvjEggHFl8yq
	aL7Qabnls8QaqWLcQJk1xUy4G4rKPBqeCr7zw80F0C5q9g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey2yj9366-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 15:13:03 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8453031c57cso6344899b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 08:13:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782141182; cv=none;
        d=google.com; s=arc-20240605;
        b=f1EhluzWGUmIrkPUayy/3/Wa87GabK7MwSx2ttUrRxrO/lJRDpPi750ftgenPx6hff
         t8I/ZCUB5T3ONqbSWoWODUiudmiK4KA7is+birTr5iD60CdnuHE7faF6NS3ahm5Y65Q8
         DwRxzJ3jcSyX2JjAZ3AFJcyYqsTWY3DPlL4G8IA5XdWT0WciYIdgXgw2YEeoginQrBtW
         mcILscDqKGPNIYUkdyQWIowCTNSGuOnaP5CtPcYzZX9laPUmIApB1IyQWU5uVH6BsbMw
         YlNkXEDQeVO+13tDfweYj37FRYyb5/8KsER/KkSdj5IyN0ynf3z1fVEs7nTOBs+OYB2d
         ugog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=p5YHH1cPRNvLPXQXevUlrGJm18UVfu7zN2fXkcwzJwM=;
        fh=YeitdTEsvHLIp5DPqaGKDA70Xg4F8B/qjn3PiArr54c=;
        b=Q7u6+ifn7tg+NhOBIQBSw7lUEJ9Tz8KFOqqz5NAbcgeOSgB79klPUJ8mtz7BogmdCG
         gQxU0E47guDwa9g6LyXoik0ekjAdamsDopKxiimemwisQ9rVSn89kA5dGD70aPp0lt99
         D3vhdvI0mmRnnwxXeI0AMkfTbHonf4C3Q8rRCseBry/peAyAY2KY8oH21oLlzm17Nq7p
         G74S6tI9MJ12ZaVKFaIEcrmkwendxeqhjxy4BdnZZkVYxbmPMhsS9zhNvkbIYJELMXbL
         FHWQGTuSSb3J+mGg54UCUd0IZCPVEIF+2imOY+SWBe6LSZcPHAJVaqyEh6nu32saHwF6
         ZBZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782141182; x=1782745982; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p5YHH1cPRNvLPXQXevUlrGJm18UVfu7zN2fXkcwzJwM=;
        b=QFInNeT6ux150QBG5huzdXml04LSWrox2JRQy3q2Wxy6RMg5naagRXOiT++yuH/FdT
         A4WUU5RwLkXBYI1YbVZtijvAmz/AcOba7S0BDkeBDISoAGGsSC97nb3pKEhiSfDihZVy
         jd/UvKF+fI4MufRzAgfDM3X3j9mGWtDoK5tCo/t9Duu2kdUTfoTHsmB9fFbDz45g7w5/
         InkXsQijtviXmGy0q2pZmvNCo0dudI2VPaaHTkzKF/nM39ePU3pSoER3hwYU/nmNeiby
         VzmIxfi+1HrTXxzjDcWD92x6vRywEHgj1Ht/PDX2TDGWpmQ7k/Wb7oPbVGzwboDzmv/b
         2/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782141182; x=1782745982;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5YHH1cPRNvLPXQXevUlrGJm18UVfu7zN2fXkcwzJwM=;
        b=G+RqA0ZPOclSS04RM6eVeThQ1QVT0X6CEfPDy0vIWhfJGIJnaGbBh2W7BuAkjJKt8o
         D/V++Pdag8JcWS0/qMH3t2ZTwLDlqLKfPX8T9sFqLoowsHGwA1Ip3YdhbTFZFYN/Iie/
         sTzLwaaNGMB3iUHaOCt4l4NleGkTl34JjNxS0dNjRn7rHLMvY4fRCJ7yNDQZXYFh39DQ
         qeCwP1VydJiXYnbmIXiA7v9814Wxz/CkcA9Ys36YH2zdDHfhRh/XmoQBHaDDMhL6aE90
         nv8Ro4hgtMWUGvXByc+eICyX3V4sKZFFARIxPJ0SLMG9mbaayrJ2BbYiQJ8b8tGzuYT/
         kvLg==
X-Forwarded-Encrypted: i=1; AFNElJ8C129S8yTgDbaE/pCWO/TAcXD2IqXtUUD0mtZgnYh/FicaJGZDWO+X5UwxsLMKWzVfgZO9UG0zxNoYoiDG@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6LPObH9yuNBRTe95Zf+xjoftM4npwsLsMD84EttFYPc9d7ayY
	ZtRYn8BMRNFbOq79deB5OviiVTzJzY0zGD552Of4FsjiyppUKm1tjvLomf2Xlq3alVQ+aEqNYpM
	nJ8tJwkCS7zk1fbQ8o2wEMsF9RrZVSZulFwwKjTVYjVXgeai8PfFGDVoYfF5N+sFbZgi59hJoOc
	nZ41MI/j4nYSL1tHlWnJnP/e0LhpyMEixGVJOOSCy0Oys=
X-Gm-Gg: AfdE7cm7GzC6mvxxmWNKwKLeSioUOPKTh+f5bRELKP+91KPp3bunoos+DwcjGsv4yxh
	j8kypVun90AIWwkMHQ9cpRdysrqCC2ZY20rTnR9EKzhyd3ZGxrkPiIOoyC5oD8+hjBEAVsm3rXY
	4lCJDOKKGo0777RFrCk0fGvKB4xEEpPfNbbX0yk5t1Ajwt7koqrGyR8gYlXQK4gz/Pp21ucCnGA
	dIfV0UdDlefA1XojTA1lOD0kAOjmw==
X-Received: by 2002:a05:6a00:cc3:b0:82f:5051:f024 with SMTP id d2e1a72fcca58-84550866614mr16439121b3a.27.1782141182329;
        Mon, 22 Jun 2026 08:13:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:cc3:b0:82f:5051:f024 with SMTP id
 d2e1a72fcca58-84550866614mr16439067b3a.27.1782141181783; Mon, 22 Jun 2026
 08:13:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604-shikra-dispcc-gpucc-v4-0-8204f1029311@oss.qualcomm.com>
 <20260604-shikra-dispcc-gpucc-v4-1-8204f1029311@oss.qualcomm.com>
 <w2y2wz3cbifnko3td3ovxfom26lll3vl5qgulksa7qnuvzukpf@pqlrh23sljsz> <f6264995-a6f6-498f-9557-723c39becf1a@oss.qualcomm.com>
In-Reply-To: <f6264995-a6f6-498f-9557-723c39becf1a@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 18:12:50 +0300
X-Gm-Features: AVVi8CfSUPRz9gDGBmkPIUFQfXnnifWv20vKVxQV_ubt0A933mN-klc7ydBhPFs
Message-ID: <CAO9ioeUtpSoorLUHXXLEjS+N_AWUtdX2ZD0X+Wss6O0+gwq55g@mail.gmail.com>
Subject: Re: [PATCH v4 01/13] clk: qcom: gcc-qcm2290: Keep the critical clocks
 always-on from probe
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: kO4U4N2Njwguxe0-jP2CivBERCWmonMP
X-Proofpoint-GUID: kO4U4N2Njwguxe0-jP2CivBERCWmonMP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE1MCBTYWx0ZWRfX7hsy90qrQkgy
 wExoOQidm6ebB6IdBQWkRzyw5k7EYH4TjbRMMxqTiCuMdhggKAV4Zq/1RV6M09rJfjSuF4KmdJP
 padQq3Y6uznKvJEdNXnKkHmaiq01/Ac=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE1MCBTYWx0ZWRfX2JgpE9tqQ7gx
 CqQa1xMFYjjTYhAgS4t+rbpzYuo/3Z23h+YD1MZf3kI6XjaFWbdLL2IOo0Wqou5tiNCXpMR58bI
 oClQgXzjNeQOEmqHShKXBGs0RaNpKfKkOmsAHM9Dil0YAGAoUGQQY1gaiB59AXZyV0f+a0PDtwX
 j2WN1GVn12INmMbqDyH1rAvfFNJeMwLGKExDAANTAWvlR1uzNQd6WXizwem/oD5XXM85qzQsS7Q
 geTR6jcy/kg831zbMo8ERVqugccswMyfENsS8B2dcFuGBTxeLUT7iK3YLS/mIUVnm/SPSzVTLLZ
 w0AUIY/BtD+9Uidtr29eKIwVc1haRh1QKnZFYu5plCk1cOvCLdExBgHeNMayRFSHvegm2sbDKub
 eVLMY+ypMDzl5x/jGstvXfV6eow4qex8trBx5mSVvjzjo54qeC0QZUl2tTUjVwhSr+oPxzpIxi5
 7dcxTox2K1Aqi5IOjBA==
X-Authority-Analysis: v=2.4 cv=YLSvDxGx c=1 sm=1 tr=0 ts=6a3950ff cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=hv-Y2RuR39m9dDk4NsIA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220150
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-114041-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 04BEB6B0A33

On Sun, 21 Jun 2026 at 16:28, Imran Shaik <imran.shaik@oss.qualcomm.com> wrote:
>
>
>
> On 06-06-2026 04:54 pm, Dmitry Baryshkov wrote:
> > On Thu, Jun 04, 2026 at 10:56:07AM +0530, Imran Shaik wrote:
> >> Some GCC branch clocks are required to be kept always-on due to the
> >> hardware requirements. Drop the modelling of those always-on QCM2290 GCC
> >> clocks and use the latest .clk_cbcr convention to keep them enabled from
> >> probe.
> >
> > You got the feedback, but it got ignored. There is no explanation about
> > gcc_gpu_iref_clk and several other clocks becoming always on.
> >
>
> Apologies for the late reply.
>
> I have updated generically that few clocks are required to be kept ON
> due to the hardware requirements. For gcc_gpu_iref_clk clock the
> Power-On-Reset value is default ON, and such clocks are kept ON from
> probe. As Agatti is working functionally, I will keep this clock
> modelling same as before.
>
> And I will update commit text that the GCC video ahb/xo clocks are
> required to be kept ON similar to other camera/disp ahb/xo clocks.

Why? What is _wrong_ with thow they are modelled now?

>
> Thanks,
> Imran
>
> >>
> >> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> >> ---
> >>   drivers/clk/qcom/gcc-qcm2290.c | 160 +++++------------------------------------
> >>   1 file changed, 18 insertions(+), 142 deletions(-)
> >>
> >
>


-- 
With best wishes
Dmitry

