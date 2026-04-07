Return-Path: <linux-arm-msm+bounces-102095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oG4zIpPR1GlJxwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 11:42:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BF03AC383
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 11:42:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49FB630342A7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 09:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA443A5E9F;
	Tue,  7 Apr 2026 09:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H2oUjMlB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cl7IAtD3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CD03A6B96
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 09:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775554842; cv=none; b=IAJwsXaay9pl2XUU3rJYlNvy2mh3copbVfTtL+cTZD9yVxGJoshj8uk/rTyxYf1aDF/cXgHITAtJfcgx8znh7LXAylZZFXyKzwju237h3l0tc2UTd0mBKS2V1NKeUUh97KLAGB0MHPQnWiU9YryGKoZD3eeXsLEQG7PKOgFGB4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775554842; c=relaxed/simple;
	bh=6u+jBwuKFw4L2H8BKdV08/AnyT3SkN/QQqCcMlMuIC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NarV8dUB2eHKJskRrp8UxZG8EJeDFquY8x9x46b23BuXbZ79pUW2ab22N5LMzAgemREROUMqWfP+AjRJCYyDXMTgDXIhap9ThiIoWZ1wYg5c7XwaZrkAIOVWMAmYdFx7GzhmR1F8mjSlJWgM+KURWq1QlZyP6yacBgYvD1fv3NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H2oUjMlB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cl7IAtD3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376kIV31403547
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 09:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ARM5bA9+tOKcd2hOMigoOXpxTiAizwWoEa05WNgpfT8=; b=H2oUjMlBwWViI7rD
	7qJd25j1PUqm/nK6WeeLXqVKX1FQUM6HeXGdVEiPjFqa4v0ZR9y20+/T+/1loPzl
	iS6qxNHSd7Oq6ruGpxGGCMmdpd9gg97YbODTf2x0JdMhAwdgY8XneY3rckOkgHl2
	0DccYqZX4PUQJVR+Ll32Fq48gGtcD7+Qs2nNtb+XY/NxRE0lnyZ3b6zX5I/Miyvs
	b7pGGnWBcvnRHQIjmGeLCywelLjZ1iouIuo5G+UmsVlKEbVY/OOf7reiA5QQIc99
	u8Xt2/eK6xk7987xV2LRj/GQMD+KKWQTCdSc/zv3u79abe0K3Jm8tD1xpYgiTc3t
	b1O6zA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8a3r2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 09:40:39 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89cd0f68ed4so19959906d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 02:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775554839; x=1776159639; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ARM5bA9+tOKcd2hOMigoOXpxTiAizwWoEa05WNgpfT8=;
        b=Cl7IAtD3YT4gppLl2tAsZTiEjRDVZOQ0EUxycD2mMM307N6WCyMZG/BSEYi5yO4IK4
         6dKdZdYk1qDq17gLX+YbTS1Dh7n9yZHqD7no6NiT4Fs5AzJOc6HIUmSOccqx4g00xQXl
         1ChnrFJWrItmeTFDSEc2a6wudoZT6nsZB9fR8geS5rEkjDrOcj69/hhw+f0BFC8UeQ/o
         huk2OPR/7nCYJtGvkICclX44t4sxF3Ev8H5KkV0mvqiHZkKz60lbszhcJ8cz4p09kqcr
         W/RGSUwLfi0QaHECwP1i7bfzCw7m8NcwsLGLFUE1EAhWtdPmFrKfqOwf8hSBv9vj7Dxl
         zKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775554839; x=1776159639;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ARM5bA9+tOKcd2hOMigoOXpxTiAizwWoEa05WNgpfT8=;
        b=njv874fTeXQ1BB8HEREWuxap44/TxgAJ7/DM2nssJ36ttbA5wTQ+kyXgeUciaxwuSg
         SkstghSr+qKYgaKHS0JPxyX1ubSZT1E/G2EWYP05Zc50t99AZAdWAWfvst5R7iVVwXjx
         045pOEcTh2Y6osDnOgjp1MLzM4ICyssy3kUK5BrqAuwYXndN61+LN0I92PLtLKTu5e8P
         dSmR7KH0FjHRd0dGwsaVDWoTFc7mGI5nn1kXTmC5qHNpaR4X39SzV9i9nz2G6jtwbJ+q
         Iltso3/K2NrPrz9cjmFurwW3uFY64LrDI84ngB0JMlSVVPQw2OG/naUCrGiBU0Clxz0D
         szIw==
X-Gm-Message-State: AOJu0Yyxtww+u6xH+b18bOMYVzgNwWQR9CqbloqpvtJGOtveTPYINa0m
	Gy8nm7GiJACiDP3A2hTrcfo8/MclTTETHaoOXubxN7jXFgF90EGwH/GCwjnA9BItwxwOAOS4RW8
	t13DZX6LEgOy7K4ByGIKAqjNiVwdIgt682jUamQlsYQrQh0zoSCIXj/BSKYHLXRzTapjR
X-Gm-Gg: AeBDievOgvqt3OAz0CQtuEEMkag+Tl+I+3rCXaHyzQ75ZydBkUOXHc4Kibdx4zvfsum
	tYP5R/jo1mP8gKJUWc9r7P4FfLtqjRBj16YPKBRQABKrBgycsOakJdOfwFS17cNTgE0clM0oDZC
	ke4b0amTcO+S14RCDdm9TSZcLjqV5UTAhcpRSzqcPrl4SXcHSnhsd4MO2s27xbCBAgmYjE6Umt6
	6DAJhDpNDU6cO1tfHewvHilADRs0ekGI5ucXKmB2kq5SBJ70wl2HTJfUXdSot0gwBvOKeB1vbCg
	AVxW0NjcADetZ1Wac+sWlGLKTHgLdO33k0dCUhY50Fxljwzo8nXONlmpE3DbFzW1aYn9Z737dQi
	4Gl/kBAVpYg7XHyXFoNBVb3kxv3N2dqHuwWl8iZZkpAkXq7DwXjONttx6bn62uyiCX3fS/5oqoz
	1LNs4=
X-Received: by 2002:ad4:5cc2:0:b0:89a:5129:510f with SMTP id 6a1803df08f44-8a6ff7a9cb6mr201346456d6.0.1775554839387;
        Tue, 07 Apr 2026 02:40:39 -0700 (PDT)
X-Received: by 2002:ad4:5cc2:0:b0:89a:5129:510f with SMTP id 6a1803df08f44-8a6ff7a9cb6mr201345996d6.0.1775554838963;
        Tue, 07 Apr 2026 02:40:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3d026466sm524062466b.55.2026.04.07.02.40.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 02:40:37 -0700 (PDT)
Message-ID: <33d7aa2c-0eb4-450d-8e10-3f335d847f89@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 11:40:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] arm64: dts: qcom: sm8750: Correct and complete DP
 address spaces
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
 <20260405-dts-qcom-display-regs-v2-7-34f4024c65dc@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260405-dts-qcom-display-regs-v2-7-34f4024c65dc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mpk1CrTnxaQ-Ey_S6aM0cm04PUJ2dHc6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA4OSBTYWx0ZWRfX875Q+1f0Rsrt
 wn0XppjKhBc2fBM8LiDAeMVPCJnJgNhUVRkKoH59kF2Os5mODpmyoXRDPdm2IqRDG4c/h6MeUG1
 ovz88d+VlC+2389VeyP91yz6fyoKVLpN20nHMgBpbQOfrKziTb8HQHJzOfsU2LD7XI/N9jMBu8k
 xyfJ0d+PUXnHZHUVeXuOWJpOTx0o/ymuoqhzyNR0y+A9ALT8v09coL7Cq+1HuQBKly/3pZzno9L
 OnuXlPchvdfORS1wML20nWzYVh5j3XYKJU8E3ymNHXoYpuoubpAzwt7hmkykrznWCDI15Z6OGJR
 5I5Y76n9GHgkPALqweMYrVhxhuLibqKry9eRME3l5zYsnnoH9XjcDhD1DUFTF6T+HVTmqqa/npN
 NkA7/dBVmGsidZfo/At7sdzsN/Fr0fCE8ymBXjQdpTAOGWG2qbmhMiPnptipvZWgCj26fxiH83M
 +qkHltzdI72HIxaiKBQ==
X-Proofpoint-GUID: mpk1CrTnxaQ-Ey_S6aM0cm04PUJ2dHc6
X-Authority-Analysis: v=2.4 cv=A/hc+aWG c=1 sm=1 tr=0 ts=69d4d117 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=kR4CFCDnwyPe45QzH1wA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070089
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102095-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D5BF03AC383
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/5/26 4:34 PM, Krzysztof Kozlowski wrote:
> DisplayPort block on Qualcomm SM8750 has few too short address space
> ranges and misses four more spaces.  Complete the hardware description,
> which in the future might be important for full feature support.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

