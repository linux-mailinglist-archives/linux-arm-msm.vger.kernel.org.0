Return-Path: <linux-arm-msm+bounces-99613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sExgIItqwmlScwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:42:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C89030699C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 11:42:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 88F8A300A5B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A8BB3D6485;
	Tue, 24 Mar 2026 10:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R2cu2WVj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X+j5YDmI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C5D3E3146
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774348744; cv=none; b=hX32PqSvckWLysjbBBNJdexepd6YWna5DpCEyIaG7MG6eI9of6IboU3vatU+c0C43HgF+2Hg2mVNHbfnb8J9d5I21uNzV+RbKtDyPiO7YlOWsqW+604gF6NTw4hKyadul7z0dzuhgNurZGi8bU7qGaCinuO8lRbaUQ/OGv0iXjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774348744; c=relaxed/simple;
	bh=ji4Q4buCdBt/nwjhvDAVS5p5y2cqvZ0ye4owGzsxLNc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oj0I0vV709i5DCwtVVQE2mSrO2Fg175TKBMkzthHMlL2eWR72qYFxr+dZ1oFYc0DYhc3+gzYOewsV294wNlLsbKpbu/tIKCV+R+p57Q43MAyDV6brADwLdn/77cw0fuVZzMvgUfvJchtkBLZD0Eq58+jQ6gFVWsmy/wWtAYI1vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R2cu2WVj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X+j5YDmI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O7REPV2371490
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Pmh8hicjiF4UT4+vCZbMqrok0SPFJ1WtADq/O2gJng=; b=R2cu2WVjlP+Du0Nt
	ros+fY+qR8U+RzBh48yb0XWOgahE5pIcU/cs3QuM6dLyVTyVCrsIXe2Z/ytj9utO
	m/NIfyJS1e1W+DgUFxUPAEC4NH1K9nuQgZiAkNdMjYkPoNZMeJ6VdfXx9e56JWfC
	HiFsMQmYdA1HGwmGP+5lAZHbxy0zx0bZoUFHYckNnZmkvqrhfsNAVs4tdAnjExMo
	j0ltUtb5ljiwmFV2+XRliThNOC7hNMmC3SUeHg3L4w6CewB6jhqHsJcRG6mwFzGU
	6y5rPmaXGzw99D28IWEoxLYFXwQhxTeAf881z1qBdnnLAuamlAHIf4mh6G3Nm1vT
	uUawZQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3p830pbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 10:38:59 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8299499d587so898706b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 03:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774348739; x=1774953539; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Pmh8hicjiF4UT4+vCZbMqrok0SPFJ1WtADq/O2gJng=;
        b=X+j5YDmIvKQrxxOu8zwNG8BZOpMa7GhKbI02n+mpMFScNCjuP/Y2NQb/zPPblkpQli
         yE2RC2BWX0+OCwKtCHy2gQXpO0aicKHP+UyqI2G1LwLK5ET2JRpLS1p+XBtVqdQsBIMo
         DR4VC3Hssds8b4rqJEEIOoGhht3ZL8lGnCMX6BHCDLSAeTTkDOFUcfclGL5SxKuvA9tH
         17p2tvhzU6hEM57hje+26OuUAUyGLwYvJVyVeBRhR2u9GHFnHp8HgnWlEyod13TRLa7G
         pUj7X5ZcKNLqh4DgmiLMboPCKceCYguiNigkZLJwUywjASNNtABbM1es+p//4PE6X8xQ
         SWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774348739; x=1774953539;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Pmh8hicjiF4UT4+vCZbMqrok0SPFJ1WtADq/O2gJng=;
        b=IoIRau2g6n3/jIEt+EUVo/HexYN8R/vH8YPy99C5V6AUtjDIHrIByW3IRd/0stc97r
         9k775xT3BDtrsuvnDJhCHdcRzS5vIQlltqcLEOMMkvrOWSO1BN0IlkFj0ZyG1LUSAW+l
         RD29m2DSkspJZmn1Py64fZ/mFkXgM20rLFmH+TFSoiytZ0mTjI6N9Bzl/j4ah3Jbj0oV
         CnL2GrVpzvdd5Zo2+N0hQzpgKWg6TXcjAlCy3m+cXWz5Ulk00zM5nGH4pDNxJwBLJHHJ
         8SyZHuNyi7sSL4qhuLEhYVOpNsrrbviDPM7uZqUTfE1yo6sd4vNMJbuRkc+ZujM21mzr
         +rrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXA/6g0PJq1bRxq2xsoIMpAwhgtdpHcDMJTIMImS1coqZup1GPzg2RMR9NBGasmcVIX/zb+wPJGWmOby3YO@vger.kernel.org
X-Gm-Message-State: AOJu0YzmtAxl9TnwkZXbHb/BxPZkz52jdRfYVnpVYxhTNjOOnzwr/muv
	OyBO/6iNYrItGvuoRev1kgRx9PEpkxEG8zUWr530UNkH0kOx66//09QIOmMDIjnHX3yn8zx1S6n
	jWbmvPnsBinorpdrzGZnSnAv7LEaoumSaBa8KoKLx102lZTzwic4CqRPTNaQDdSW9fkxH
X-Gm-Gg: ATEYQzxdh5DLY8mdOjTPLuqJzDz6Cg9lt8HEOkfQ8XAZPbrGmL6mPNV0CFj5V42VIe7
	k55c3RQYSTZKuR7O449ep3QoeaybxvWIi0VXeBKLGOvxkeoXrbCUuZW7W1Tq4F4yeMf0mr2O8gb
	bdquoeenAUAi2FYcXw+wW0PWAOla6Ao48neoaKWdW3kBXlKWhrxE66UTYmK0LwLHlmzn+/X7cs+
	ph1Ei7uNspDTSa78gOFKRDQI6tiDVSAxVOiMLP6MIV+2wfajcfTXOyLodRmR28SuwYbb1HMYQt3
	HXLCEnmutuq3Y2YwttHOwztYZcJlmjOhhM2a8aJcooZk3DLBEMwaeNJha6F+8V6xCx9pNemRYhg
	bIY9DIcZVSZZ+5VhiDKAxor+FVD/vOEJKM1YTDXdWD6WkP19MIUad
X-Received: by 2002:a05:6a00:1789:b0:81d:dd3a:b8f5 with SMTP id d2e1a72fcca58-82a8c35dcc8mr13802701b3a.38.1774348738948;
        Tue, 24 Mar 2026 03:38:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:1789:b0:81d:dd3a:b8f5 with SMTP id d2e1a72fcca58-82a8c35dcc8mr13802670b3a.38.1774348738405;
        Tue, 24 Mar 2026 03:38:58 -0700 (PDT)
Received: from [10.218.44.178] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b040da3easm11603694b3a.41.2026.03.24.03.38.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 03:38:57 -0700 (PDT)
Message-ID: <e949be15-5d9e-4f17-a970-f8906dcc5744@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 16:08:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/11] arm64: dts: qcom: sm8450: Add power-domain and
 iface clk for ice node
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Eric Biggers <ebiggers@google.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        David Wronek <davidwronek@gmail.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com>
 <20260323-qcom_ice_power_and_clk_vote-v4-8-e36044bbdfe9@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20260323-qcom_ice_power_and_clk_vote-v4-8-e36044bbdfe9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA4NCBTYWx0ZWRfXzqMAbJcBDfhU
 axmkz6cMxtsLJLl6dj7PvnBeRHwQjXl4HOzvXMkQWt7ir7NxFR7SO/ezl7AkQfR62yR5MWATjfr
 e4dMwAqKEhCbQ5d5BeIitK2K7AewRD+W8xRViwXGFtbH/6q028Zy0fPaWh9rhsznS15DotELbz2
 6rfUrR8/HK4GZZr73t7VV7RToNyS+M5BlzumIaeHAARc5+aFVtt1R19HbVEENrfyPbN5VvsxnYv
 FIADOkybKNlaymXS9eZjxyPulCUDU7YYsFoHtXZseEiU8vNZUOrNQ/wYeTOMjHIhOn7hebdcbFH
 Aa2I+21wpuvHgWYO5U9Eyhcmzq6uJhZGlmjTZ0+PrSgzew6KpNoPOJv6AvcwAbmnbIBc8nuteuX
 oeBT1UmOXlDLBvBaiqNyJRAOLERcC664NPZ6f97kd6CTX+xQbbgf6/aHZCfDaKdwoO7BAA2moRH
 Y309Ofh358AeP8FuQHg==
X-Proofpoint-ORIG-GUID: 3Um383qoIZuTphR86JWuLF0-B4O2kqJK
X-Authority-Analysis: v=2.4 cv=F6hat6hN c=1 sm=1 tr=0 ts=69c269c3 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=RcdfdvLsBkETvr5PKcUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 3Um383qoIZuTphR86JWuLF0-B4O2kqJK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240084
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99613-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gondor.apana.org.au,davemloft.net,kernel.org,chromium.org,google.com,gmail.com,fairphone.com,linaro.org,quicinc.com,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7C89030699C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/23/2026 2:48 PM, Harshal Dev wrote:
> Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
> for its own resources. Before accessing ICE hardware during probe, to
> avoid potential unclocked register access issues (when clk_ignore_unused
> is not passed on the kernel command line), in addition to the 'core' clock
> the 'iface' clock should also be turned on by the driver. This can only be
> done if the UFS_PHY_GDSC power domain is enabled. Specify both the
> UFS_PHY_GDSC power domain and the 'iface' clock in the ICE node for sm8450.
> 
> Fixes: 86b0aef435851 ("arm64: dts: qcom: sm8450: Use standalone ICE node for UFS")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Reviewed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

-- 
Regards
Kuldeep


