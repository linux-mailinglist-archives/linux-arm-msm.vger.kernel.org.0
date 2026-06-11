Return-Path: <linux-arm-msm+bounces-112687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pk00Ow2DKmr3rQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:42:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AC3670848
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:42:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QgR43M+J;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cFnPZbE9;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112687-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112687-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ADEBF3044290
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 09:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9B7D3BE15F;
	Thu, 11 Jun 2026 09:41:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7A5293C4E
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:41:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781170904; cv=none; b=k5+UuXenc17/nd/PAZC0IDOSppd6Iuxp+exYU9EgT6TX+T1Zt2Mqm/OgXDgwbVcd0lbSPEI7RTYv0A5gXbWqhEv7W75O3Ac+JNNK/08eisTu/jwkN18SWtxRzMGKDLU8gNhgQCT06v1XxquebrUvebciSVlbzpW+5vrhMwhMXA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781170904; c=relaxed/simple;
	bh=gs29JVYoqBRbD7XbXz5ZIYaa4W+R/0h/qmCJb0z6MrQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fgvnalTZGbnUvQq+/ZgA3US0SPcLkFiw9Eyapkmr4wmn0DPYdEb97pNc26Ub0uXZ4VkpjEJx4v5YLz0XrbDcnszRvxdcKW59rpAzS02nGcsiZHyRC9hV5lSwM2yVVD3cGlr162tmoUqO0ODEqevwbqJJwHM1qbvQFXsb1eJye+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QgR43M+J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cFnPZbE9; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GIJY3791689
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:41:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OsmgSByejwZrCh97iurQ7ytYSxygMHrNyrSm1o7mkBk=; b=QgR43M+J55gTURjk
	Rg2FWjzuyB7bLsejkZh8yl4h++Uj29cnSBh6Y66KBz6j9civNb+dhHoPpxMEPwE1
	tvYVB9/kudR12FCb68lSgXyb7eQ6rmkezCfjm1FmUcryIKA7dfzCg1rwv33NgGb8
	y0YzgYZCb7h2UpFKknxlsnzzmqZkJnh+dckQk39BYuAHjC76RTjnZTl8YX5lUeD+
	u3QcXcJYf7GwSyzeLsQlK/G/M9xIVfETfd4T2xQqpk8Ll/pE8R+zaHFSI5n1+bC3
	s5XxmYtxknuI666vy7fq8aVfsDo4hkgPjBiU8Ar0+1mQrovsrWZjAdO5i8f/tcz+
	kk4Bpg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe702smh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 09:41:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5176891d0a9so19799501cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 02:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781170902; x=1781775702; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OsmgSByejwZrCh97iurQ7ytYSxygMHrNyrSm1o7mkBk=;
        b=cFnPZbE9qa9dhkKxIWQw+SUe+5pnGnVdqNdx7UYq2tFziOF6+qdgBDpHo1GMHKapWz
         kMBFzQ5WZQY7ZoxW3jyu9NAEtNUSJXX3OlrmfJ/Hp1qzOIDkNkL52zj2UP+gYvh1eX88
         mE+KFHfL0JmfCNj7XpSAEeFEEloQvrKVChD8uZRK5uCjXViJIVl71NBoAK+Kem4NkqMb
         YAJYSde3dVKw/P/sn9817XsFR/pgeyOfsvrZPJVwk4Efa9xDEhC06QM3LyOKNaLJ4xmi
         wwA9x7F+3JURi/ih2ADQGliL0yC6qeqwvTxcvVpW9ZqixaWJ2G8GXjfiMrHC8hhACM88
         H5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781170902; x=1781775702;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OsmgSByejwZrCh97iurQ7ytYSxygMHrNyrSm1o7mkBk=;
        b=pPcCiKy6WDjWIpTH8n0dsDOgHmhTW34rXRFLOlth8l0AIkxxwUi59p040ac8OSVejU
         BZAqTRHrq3LKjd1ZX1M/BSREgF3Y+Nt7FWXleMys82PiBaGVmuDQAy7Oj6Nc7C8IwHdw
         B6xmPczNgcfw/eItCkIITQDeqO7c4Xo89cNsshK+0Y4SpFsbJhr3ejyURbz1Lo2vQEIE
         dt1jwMwF5vhwGLxZR8KzoEgMR/BzsQzGaOJlcHc53EsqZ24omxJVIaPzSoiYKjoVQoZD
         lGOSdQ6nBuiP3CS6Tlp5mhiiGkRe4Hy53AROjf4M4qy4i0rmqb8gFZB48OZ3ndJ6n3e0
         Jrjg==
X-Forwarded-Encrypted: i=1; AFNElJ+WQYZL7zjWS3svwKhZmeWtJq/AP7LQaQ3QgqyVA6hVfoV3THUT6dsDZyFL0HNX0vNPH0hcv2kw3fO1TPTs@vger.kernel.org
X-Gm-Message-State: AOJu0YxjW8uwzLwazoKQFDhkAb5nXOmeYIzcOpjKQYF3hAWFpfv/rQVu
	2JwEJM++6fpNTUBjttI6UQVFdOyTh93kAZ18Rm6Ixe0lhAqomAwSmXLGzhSizRNQ/x2ONNQ7o29
	2jJGLLiKEZbmVMp5n0ByWtU++5sMc3MXmS/f315ltE++uwFb/X38t2L0wCqLWSLfOvMxt
X-Gm-Gg: Acq92OE5wLv6sbhc13iHsLxG2PfjMgb3hIXcW3dRC5I+dHCRX/5b7apXc/1j2GBSt7z
	jks/CXTigWC9Ad2chHqAALmGEA/ZcICzmwvtn9rZD3hOC1iqo/VjWmHnlO7DXiwsWK17ByyKHb0
	KtIPVVReW4G7Qn5WSSChpY54vh4YC+41OEXF1tXJ+zeqd1pxDh8vEyFdRn4HRwh5pMsxofc2ZmQ
	S/KAHc4YZ4uwv3JDksSpgsZjcJefQUSO75N+aTFFdtIy/m7eOPQQVe+Ag5aJUhAlu8ntmnDRK/3
	f5HpuinOYuOzwLzyA3+/kaXThTA2/bwgVIUFnhUwUU7bjuy19ljNu1uiCofKSfo1uh1jhRxAY/z
	IMU27kAg3BoJfR2TgkbtMyIt6uWLI5NWynR8VZdaZk3s+7pzm1iLfeM10
X-Received: by 2002:a05:622a:1449:b0:517:8999:6c4b with SMTP id d75a77b69052e-517ee262f43mr19341711cf.7.1781170901790;
        Thu, 11 Jun 2026 02:41:41 -0700 (PDT)
X-Received: by 2002:a05:622a:1449:b0:517:8999:6c4b with SMTP id d75a77b69052e-517ee262f43mr19341481cf.7.1781170901370;
        Thu, 11 Jun 2026 02:41:41 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb58cf947sm40282866b.43.2026.06.11.02.41.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 02:41:40 -0700 (PDT)
Message-ID: <fe6bab50-f839-48ec-a393-ba0243baf5c0@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 11:41:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/15] clk: qcom: rpm: use clk_determine_rate_noop()
To: Brian Masney <bmasney@redhat.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
 <20260505-clk-determine-rate-noop-v3-5-f3f829fbacdf@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260505-clk-determine-rate-noop-v3-5-f3f829fbacdf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA5NiBTYWx0ZWRfX7/3aanUfmD/B
 FNo3nJ1g+NbirEJWJTW5o6sG2mH7/Y5g4ISK6GO0vPT41MgqE5C88GCM6siJDjRYTjExYRMtTQf
 LcWHlCsh5uOqp+9u3rFGySYDZjmCqqEH75F/cgM60UtEn/gwzCIIqkfKV1G3jVbq6+XiOJJJg0p
 FfOa9ngQKAjC1mw2QWB5mq1WsK7XBh6SyxLNpB5wtgHFec48zxRtszkJ4aQFPeyu6HqydRdrJSo
 4EO7jTUgugNWC8W3J9N/UmATQXC2tli2zqTjXNZCCQjaji2Ct+uuZ1HwoGKxDT+ERTemP6sX0xn
 jHKDg5acFfiRkuU/eA19r025nBOziZUvfh5IZgSziyRX0eYZy/ywcjKVp8w8zL+ZbUzds8utQPo
 AQmJI+fVPjuAeFN1XFe63xF/H+wUu1Wq80pSQHYDwfMhLZsZvlVyvNu3s9BFxJDRaRNuHt0uoIi
 xhDPUZ1TFM/gFMTN1iQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA5NiBTYWx0ZWRfX1q6GUL/wOLoZ
 jxONgh5IxTdgJiLXreP/b6xkFWLZwpwOFXjYXbW4qt7RhOx0yrslJF0tw0A/+RwQ4mGNArmnInz
 LWNByLxHLofrKOtGU7EaBKXmdyHAsl4=
X-Proofpoint-GUID: Up_pKGj-Ciz3QPqbaBrcqaHGv2AGZrVK
X-Proofpoint-ORIG-GUID: Up_pKGj-Ciz3QPqbaBrcqaHGv2AGZrVK
X-Authority-Analysis: v=2.4 cv=Z5Tc2nRA c=1 sm=1 tr=0 ts=6a2a82d6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=yiv6Am5jRSTGblAyIcUA:9 a=QEXdDO2ut3YA:10
 a=tYq66TkwoL4A:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110096
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
	TAGGED_FROM(0.00)[bounces-112687-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:bmasney@redhat.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
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
X-Rspamd-Queue-Id: 66AC3670848

On 5/6/26 2:49 AM, Brian Masney wrote:
> Drop the driver-specific empty determine_rate() function and use the new
> shared clk_determine_rate_noop() helper.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

