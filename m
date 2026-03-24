Return-Path: <linux-arm-msm+bounces-99581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HzTIBZawmnQbwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:32:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF39305A05
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 10:32:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 29B3030698E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 09:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F6B7388E60;
	Tue, 24 Mar 2026 09:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nfjebp2q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BPOxJqgm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B0836F427
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774344123; cv=none; b=Q/xqPNwwNmWMmF+lohQu/2yApVutytFla/NA6rxD5dnxQiIkkGZmlgNX847F+fbtm7GZsv9m7iMkFd4o2Q4RYG74PN53yLlKU3P4HL7gOV/PQ+ZeyhxKo5O6AhUqcn5WgBU0s4ljG+OrD3RqUVHZ3IQ0FHyZzYvyOVEqMOlxDvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774344123; c=relaxed/simple;
	bh=oeoMDPM3LRLWRy6Z2/BOgHT9lyC9OEUVfZIzQfGcsI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M8YH/G5OfJtBfdi+yX3ZuB1MimrLNDncDHgOLWWJIqk74toPKALpWypYEiHFYoJXUSVO33QEjdgpBequfuAWLZ9s/GIbplY9ySKVhjdVutwaLNUKmLAHbwvPs4q8lkZkJWfTZEp080eF7sm6SHKrn4uwq8fZ435S8qqmfpwQs0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nfjebp2q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BPOxJqgm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O3Vh194059272
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:21:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0a7+CbjtL5YYniXPo0gS7n8+aIO05dBx9x9MTQ0vfco=; b=Nfjebp2qNUVdMnZG
	mcNIghZ+UDsXTVev+XXRovZETuGFhrL18xNcSUjet5xoyjRSu49FJVO8ALqsp5DZ
	gHh6kw71+9ngvZ7IMVrUJZ1fX+F5QjfmpPQ9GmhFNqvbHguFwumr7HqXa+6OBCnI
	8A+MitxC3uxH0dBvqA3j+Bp8sK//2avfKJuy4YRCsoeZgn0ivaIzpq6VPTHTaGJR
	eanP3qU8E1LUXhjCBykGFxScEFSZ6E1uPYm18IiM4MY2GR8A8PjOVbT4JezbDWx/
	AP6l9bRETcpGS2q4NXoTi1pC2l4dBVYuO9McBej2a0DRlA1Sy1ICw3MesfZoFAE2
	vQT2Ww==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3jsks62j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 09:21:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b27636835so49538491cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 02:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774344106; x=1774948906; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0a7+CbjtL5YYniXPo0gS7n8+aIO05dBx9x9MTQ0vfco=;
        b=BPOxJqgmPrqxV4DucZ5f8WwTTauews+W5gAdM8XCLzrSqPhit2hv90s9nJnBR20I+z
         cfhbnKIM4RXqjlKPVWIk9lPjvGzEIYgH7WQmeXRUOxEgepJOpbmHOBzgLExw0nSmKKZY
         NUgvpGtC6SWGC5Zk5a3tJiTMF0lT4UV6Gvb/2jxCsJrGITsqQfFf9rmTmmTAEo7CA6+m
         W3+bvOPsEllR1LWs3N4KJT6/OPBZ5C2X0tiwacbJUIgW0BWc/zxy+FIom7pMJC8ZT2DF
         on4Ch79yo9S9od/U2NUq+Z59JdP2US3Eknr5O4DVjdsSQvioRAr7wJBNc7gy/lObhnf+
         2CgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774344106; x=1774948906;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0a7+CbjtL5YYniXPo0gS7n8+aIO05dBx9x9MTQ0vfco=;
        b=mkSEmzQ7Abxp3TIBrHhNJwy4fy9hIAXQ7OLP5r8JmDKuuQfSguaENTytmRxZO3keed
         1NsrxZcP/cEgeOPua+78KSwhl/b39ugPA5JsaBsVSkcGOiFDgZzSEExQXCtkteF8rQL0
         wMhxqrYenwCbe/1aGhJvJjHXOaGuOR80oAVRM8KHedv38D96nXQTEyxaZe8xfBY4PYPK
         vSQkL5YxO+6tT7N7h5QhL+Fy8vnrO0+SZjHdysstPeLxmCN0/54fWonLTj6HqbulL0+d
         7od1uk9D7a4ozt7Ar/Ym/8SpOJ3Jtbb8K8d1mUPZshew+csl2EvmP/5GDZVgtzNjGAKc
         ougQ==
X-Forwarded-Encrypted: i=1; AJvYcCWS6PMnT2g5P5PbZlXzcgV2nWOqV3TRMGXof9o1NkrMbuNwSwvIe7SwHNCGBETImDXZG2H6W3xyoAgpLMcp@vger.kernel.org
X-Gm-Message-State: AOJu0YxSmZEHXn5jLFsdauGvpOuJJxCRD0GlOuTwZXE2wuA5apiIVLUs
	w1QhY8oAYa3h/YdfPPR/a7gKSZoobQDygBAQVRWVBkFzkblCyHCiJ89QAU0cNPROkuYpSs5yWvV
	lAkVBvrvP5F2GPgJl77jxwXGN/95mOpqGvP7TjmrNkPPE9+l/ASZk0oDvuJ3QpmOefQZ9
X-Gm-Gg: ATEYQzzqpP1swI199eOYLm08Jfg3bKflmL/WNio7vAFS4PhFj69Xs2caQ0SkGldFvl/
	Ly4UMyubI91HOgMiij/Cn9nsmyFxbHYHzM2uBrOJZkvsqSo6O4zwszVARI9odbgVVfVExHr6wHI
	ly+CbwHnJlX7WeO5j+VWbDpeB75mFp4m4aeDeVJWyASJj6fhd0GPd6P3zzcBCZAzyHdBtzqXPXt
	eXX0YOa1o3b4P0PovMY+LROC7+79Uj/Dct6JKf+7Fu98jWP6fEZTy2mjWnqMgJBvXHKqqdWO+oM
	saDMsNopknrm1p/KVvpYv1ONueB48FAGiYq9X14eUgTOHl77Ip9Ax5rvsCSmLs3GXdMe0xF4hNL
	7IBoJJQ9FSsAt/EXcQrsZ3CouKO+X82dGqP+fpcls/rUM+q/5HIHWBRvUkQztXf0pfDZ8Fw0NZq
	DRxOY=
X-Received: by 2002:a05:622a:46:b0:509:2a92:8088 with SMTP id d75a77b69052e-50b373d0bfbmr192230791cf.1.1774344105815;
        Tue, 24 Mar 2026 02:21:45 -0700 (PDT)
X-Received: by 2002:a05:622a:46:b0:509:2a92:8088 with SMTP id d75a77b69052e-50b373d0bfbmr192230581cf.1.1774344105349;
        Tue, 24 Mar 2026 02:21:45 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f8c16csm614132566b.16.2026.03.24.02.21.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 02:21:44 -0700 (PDT)
Message-ID: <15d0ea68-8ee0-4937-87a0-7ccd8969036e@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 10:21:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-eliza: Enable FORCE_MEM_CORE_ON for UFS
 AXI PHY clock
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>
References: <20260323-eliza-gcc-set-ufs-axi-phyforce-mem-core-on-v1-1-b6b7a6f3f8c5@oss.qualcomm.com>
 <26twtzbvqcevl7jq6idkhhhasf4kuu6a6p6qby2plcg4a3vola@exafx7os7jls>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <26twtzbvqcevl7jq6idkhhhasf4kuu6a6p6qby2plcg4a3vola@exafx7os7jls>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA3NCBTYWx0ZWRfX6oe6y2kf7kkc
 cHnGd/uYuetlouiiGb8LqFNlpbvPdxYNckb0dJds0Gnxz5E3PDdBCVd+f4fmkWkr8IjPaHdJkKx
 f0Yz83Nm/OOA3jGEbdtF3bZvNexmIXAaM7HS/52zMoimbJJ83pTWo0goz+04BATFzSIV4qxs4FY
 Jlkdx2OWmlpF4HGsIhVR4NNOwq+V84htr0RP81sCHqIP/5ryD969cDSRe5gJib4aY1LLO7nbvwQ
 MlMJC/x84bKlUWGgvvWHA7/6vOOfCjtj95w2QoP7+5HtIHkchydQW+zh2bJ+UH/iGNV/ondo1JF
 he23n7uUewPJTi6rfxTZZMUmbysGm3g4uX61qE4g2X1LZWzpYeCREK/o2ZiFgmmW8V1asJwFccK
 NdQZYB5Jf146zpaIZCPSKNYb2kE9+8mj6C1C5PCk9KCXgX12jiZHEj+NrQwI7W08H/rgtcd6Q0N
 IQ4FsMZXjuAFAmwYhIQ==
X-Proofpoint-GUID: kBjNoMixXTZInFgyqUb1RZ2Uw8eSDJdX
X-Proofpoint-ORIG-GUID: kBjNoMixXTZInFgyqUb1RZ2Uw8eSDJdX
X-Authority-Analysis: v=2.4 cv=I+pohdgg c=1 sm=1 tr=0 ts=69c257aa cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=553ZhuPF3g2HGwrCK6AA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240074
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-99581-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EFF39305A05
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 8:25 PM, Dmitry Baryshkov wrote:
> On Mon, Mar 23, 2026 at 08:57:12PM +0200, Abel Vesa wrote:
>> According to internal documentation, the UFS AXI PHY clock requires
>> FORCE_MEM_CORE_ON to be enabled for UFS MCQ mode to work. Without this,
>> the UFS controller fails when operating in MCQ mode, which is already
>> enabled in the device tree.
>>
>> The UFS PHY ICE core clock already has this bit set, so apply the same
>> configuration to the UFS PHY AXI clock.
>>
>> Fixes: 3d356ab4a1ec ("clk: qcom: Add support for Global clock controller on Eliza")
>> Reported-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/gcc-eliza.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> Do we need to apply the same fix to any other platform?

FWIW on msm-5.10 (8450 kernel, from before-MCQ times) there's this
excerpt in ufs-qcom.c:


static void ufs_qcom_force_mem_config(struct ufs_hba *hba)
{
        struct ufs_clk_info *clki;

        /*
         * Configure the behavior of ufs clocks core and peripheral
         * memory state when they are turned off.
         * This configuration is required to allow retaining
         * ICE crypto configuration (including keys) when
         * core_clk_ice is turned off, and powering down
         * non-ICE RAMs of host controller.
         *
         * This is applicable only to gcc clocks.
         */
        list_for_each_entry(clki, &hba->clk_list_head, list) {

                /* skip it for non-gcc (rpmh) clocks */
                if (!strcmp(clki->name, "ref_clk"))
                        continue;

                if (!strcmp(clki->name, "core_clk_ice") ||
                        !strcmp(clki->name, "core_clk_ice_hw_ctl"))
                        qcom_clk_set_flags(clki->clk, CLKFLAG_RETAIN_MEM);
                else
                        qcom_clk_set_flags(clki->clk, CLKFLAG_NORETAIN_MEM);
                qcom_clk_set_flags(clki->clk, CLKFLAG_NORETAIN_PERIPH);
                qcom_clk_set_flags(clki->clk, CLKFLAG_PERIPH_OFF_CLEAR);
        }
}


i.e.:

* force_mem_core(true) for ICE, force_mem_core(false) otherwise
* set_force_periph_on(false) for all
* set_force_periph_off(false) for all


Notably, the Adreno driver messes with some of these settings too, as does
the DWC3 one. Older kernels (msm-4.19) also do so in MDSS, GDSC, CVP, 
camera MMC, PCIe drivers

Konrad

