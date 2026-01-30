Return-Path: <linux-arm-msm+bounces-91268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKuRIqSJfGmbNgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:36:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 297D2B969F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 11:36:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7787B300614B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 10:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B631E35E555;
	Fri, 30 Jan 2026 10:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o6T0LzFk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dh0FB66d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A1A352C50
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769769378; cv=none; b=KSTa7+voIU+PIiePwGJukBs9/T1xoAvo4uOFnuWIRKf8I3Lndmr/HPNrk5undbXoiOLYMBMKukDM8HTuSqjSREk6siFmlxWgbGpiyqR4dApY/HpXwtRqvypcSPl78DdgOrXXspOGiPsSP6s0JfIM4MJZ35wg1eIyBwl9jjg6UF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769769378; c=relaxed/simple;
	bh=hfmrj9P+j01HoA3GJA5njWt63IBxLmC9zENgjTjmTMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=axn3FES+16q0VL54buNIcQubmpKxXRjpWultRb6oCUv2/O5p1KzReyzggRy+pIRvM0lbogetBXvqr+49YhK4QET83gvKWypLRuTot1ZTLvh0vqF6YI1CcDCnSt6fM+Ata4g6qay2whlmAOAWK73jNbjY50ZXeGhlZnMh/Nq7op0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o6T0LzFk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dh0FB66d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UABpZq2992829
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:36:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wl5V3XT9hGaQENmvghDS/LfyoUs8wvTCz21wt7ua918=; b=o6T0LzFkZQLf7QDN
	hQ4NQjA5oYIx5jfzJ4K7iXKjuu+sndXC6305/S+9EewrR7NGdEOkw55w7qr3uh7Y
	1/y7naD9fJg60N3D6sqOxd4d9KRyTDY2oiT2zvkBbEaHP3HX23Ecz70feOjA+yYH
	NE/z1NfzHdVc7/9JG4cECh0afNMTubuV3fq3nLXjzjHRdO48aUcngbdAsAC++BHl
	wBncQNRVJ47+lepvJsrsAMLTa7JoWTSocro8lmEEQ5mVIUPKZ0MReK+9eitzqQG8
	nq6MqbVx66QfoVgOjOdZ3dIsHqnEo9+eH4wK3Kujp7ivqPeosKiYZbGxupgnxcfZ
	L1JznA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0db1jfjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 10:36:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70cb31bcdso47605385a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 02:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769769375; x=1770374175; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wl5V3XT9hGaQENmvghDS/LfyoUs8wvTCz21wt7ua918=;
        b=Dh0FB66dHPO/PajRLnRijUt+MN41AY7VJVR50jPyhqTNW0QHzYns6Px6EMlLWyJswE
         aA6BqYlpBTPw1o/Vj6ZNGoCJaki9bbtdXNraE3ch1BMSUgeL6ccktRo7aGhMnkhf3OJi
         Mo34RzrOzSS38+pyJJBjYsNPm4PQ0ELL0zGjL+CI9vP0qFnpyQPEY4O4+ekTPiwPOaOR
         OZDcDeydbnhidjD6sc6sN5IbvQ27KfyvpD8u9chMYbdCDkuXC5L7xQIcLwiizLfQm17z
         +VkqjIHlPugJMzFeGFvinzDDHNWkccWSTgRnRmqi8fyDbnYyCYSpef4Vc6KDmUhv/Ind
         53CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769769375; x=1770374175;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wl5V3XT9hGaQENmvghDS/LfyoUs8wvTCz21wt7ua918=;
        b=XeVCyn6uz+iCeTmORJObUtIg0PLj0uNIlm0odDiwzP0daBG7yDqk5QlwPEPHmxVT3M
         ecafosGi8Zc8gfmxVhKeIDx1kH8SnqdKtCyuowuwzN4LUeYmf5Ilw/WNrMiOSxw0manl
         Lhpwnh/BQsOQo2WDILgQNQaSQi6Ud2XPZ2v2vEyYnmqKlwUOk4DTqecw2PAOu4NrLuNv
         tGlBSMk/6UsypSzlh9WO4qUvQWTuq5YybVyexluerc0dj9u/N7II873+XzNOCLG/JSE6
         mbwfYTeWIF+O2AVb8TpNoMKNgdldibLVLQaBEH/vFYQChQwftdPU3MDa1/2bpKH2gyIW
         xA2w==
X-Gm-Message-State: AOJu0Yw4iTMomxvAP2BN9HtCX360+YGNYfmQ/3lBsDcx2BZrj5Em9f1T
	Aob66keWlmXghviQUoxwgBbnMZ8o/+TaD1xMO4w2EejWIjVwkO0hX5/eEEnh6fEY4tik2te62tG
	m+qQIAl2ncf5EY2dPY+MZ+iKwotrJDsAZ1lqJmAubjXR+kWqqaUyeCqxKzIn4uXF+xGuN
X-Gm-Gg: AZuq6aLF0kQzoz3Z3A+tXxzsOqZKDkgIOUKL0ikYUkao4xv3IBGQQrBoocMAkUHsxNW
	3gLaNr0KfW12EwGTm2rlyGX3EBRfeKo2Cj1c7Jj+BMjW206YqHZ48MDYcTsdbuGgrYzznZy6Spe
	H/rzcVQ33PPJvCKwkgfpIRjCATynLvLi33WFpEi5fNPpZ+G2H9n4bfnBOQzU2M8tj/aQHrhx3ye
	nAX/T31pfg9XFZ8ee+5y0ALlc4zYLudK0JqO9OaGVdKIxnyCJiMHi1YvQ2UYT4o3MKLZxdjyAES
	B7VL9vWOGKt+wdZ6ek6e5WtWZtpJpShRI0J3ivz81fpqITncyKkTUvk3nuouWjhrRI5jCcYUPW3
	IEVTbkbuK0/WLiZGXJ/I2/IfSmmR0lqikxsxvb/THN3PJAyRVCIMDQbxP0LMj1hmuxGI=
X-Received: by 2002:a05:620a:1a18:b0:8c6:f7ad:49b with SMTP id af79cd13be357-8c9eb29d0b9mr271019785a.5.1769769374850;
        Fri, 30 Jan 2026 02:36:14 -0800 (PST)
X-Received: by 2002:a05:620a:1a18:b0:8c6:f7ad:49b with SMTP id af79cd13be357-8c9eb29d0b9mr271017185a.5.1769769374372;
        Fri, 30 Jan 2026 02:36:14 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbefc69ebsm403930966b.20.2026.01.30.02.36.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 02:36:13 -0800 (PST)
Message-ID: <121b00a2-2040-4ac4-9ce4-3865f9fa09e7@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 11:36:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] clk: qcom: gcc: Do not turn off PCIe GDSCs during
 gdsc_disable()
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        manivannan.sadhasivam@oss.qualcomm.com, stable@vger.kernel.org
References: <20260102-pci_gdsc_fix-v1-0-b17ed3d175bc@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260102-pci_gdsc_fix-v1-0-b17ed3d175bc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SooBQF9ApejQhqzacxHZg33ClrUMDFSk
X-Proofpoint-GUID: SooBQF9ApejQhqzacxHZg33ClrUMDFSk
X-Authority-Analysis: v=2.4 cv=VMTQXtPX c=1 sm=1 tr=0 ts=697c899f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=67GeUOcPIWvtFfd3FpAA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA4NSBTYWx0ZWRfXxfo2E6RvAOuk
 U7slODSFLsVjdWITFZVNZKvofWoGZyUqJDj6Hx6v3Wz1rK5bVyN46t5+yUH2C3SmTqvcXt3lxBz
 reSxc6rjEXqQVt57rlFFga8Xdq8qMj9022ZkgR/ZAYUYUo1UUaj1kpfQAjm6GUTnEPUkQ2++Xq8
 dS+2xKdnimZ+aMe8PXDX5KQkKoGd5uPwcFHXtW8TW96F3jBFtE/UZ18XJum7UG9phuroCB98Soc
 LcRUD19DOeC4nC5yOwF6GXdm4UkV+NWCzgxiEgYfJId2oNGCShcywcjR3FZIxVr2kC50gOuTJse
 F6+WYDCRNICcZ9MQaTqb5g63PijKf+AEpbmltWiTSxUDCVsSIweDtWqOKxQc4olBq3BpbhM0OXn
 djqN8Baqs8qN78mZzictmft2MrqtFGgxKIj9xhUw06rDp1n/Xu/7NPPMiNO3rU/xMbGQi4SaZXQ
 sHenbSePzkxcs17v7LA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300085
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-91268-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 297D2B969F
X-Rspamd-Action: no action

On 1/2/26 10:43 AM, Krishna Chaitanya Chundru wrote:
> With PWRSTS_OFF_ON, PCIe GDSCs are turned off during gdsc_disable(). This
> can happen during scenarios such as system suspend and breaks the resume
> of PCIe controllers from suspend.
> 
> So use PWRSTS_RET_ON to indicate the GDSC driver to not turn off the GDSCs
> during gdsc_disable() and allow the hardware to transition the GDSCs to
> retention when the parent domain enters low power state during system
> suspend.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
> Krishna Chaitanya Chundru (7):
>       clk: qcom: gcc-sc7280: Do not turn off PCIe GDSCs during gdsc_disable()
>       clk: qcom: gcc-sa8775p: Do not turn off PCIe GDSCs during gdsc_disable()
>       clk: qcom: gcc-sm8750: Do not turn off PCIe GDSCs during gdsc_disable()
>       clk: qcom: gcc-glymur: Do not turn off PCIe GDSCs during gdsc_disable()
>       clk: qcom: gcc-qcs8300: Do not turn off PCIe GDSCs during gdsc_disable()
>       clk: qcom: gcc-x1e80100: Do not turn off PCIe GDSCs during gdsc_disable()
>       clk: qcom: gcc-kaanapali: Do not turn off PCIe GDSCs during gdsc_disable()
> 
>  drivers/clk/qcom/gcc-glymur.c    | 16 ++++++++--------
>  drivers/clk/qcom/gcc-kaanapali.c |  2 +-
>  drivers/clk/qcom/gcc-qcs8300.c   |  4 ++--
>  drivers/clk/qcom/gcc-sa8775p.c   |  4 ++--
>  drivers/clk/qcom/gcc-sc7280.c    |  2 +-
>  drivers/clk/qcom/gcc-sm8750.c    |  2 +-
>  drivers/clk/qcom/gcc-x1e80100.c  | 16 ++++++++--------
>  7 files changed, 23 insertions(+), 23 deletions(-)

Using a terrible chain of shell commands:

rg "pcie.*_gdsc " -A 8 drivers/clk/qcom | grep OFF | awk '{print $1}' | sort | uniq                                                             

I get a larger list (it may be incomplete):

drivers/clk/qcom/gcc-apq8084.c-
drivers/clk/qcom/gcc-glymur.c-
drivers/clk/qcom/gcc-msm8994.c-
drivers/clk/qcom/gcc-msm8996.c-
drivers/clk/qcom/gcc-msm8998.c-
drivers/clk/qcom/gcc-qcs615.c-
drivers/clk/qcom/gcc-qdu1000.c-
drivers/clk/qcom/gcc-sar2130p.c-
drivers/clk/qcom/gcc-sc7280.c-
drivers/clk/qcom/gcc-sc8180x.c-
drivers/clk/qcom/gcc-sc8280xp.c-
drivers/clk/qcom/gcc-sdm660.c-
drivers/clk/qcom/gcc-sdm845.c-
drivers/clk/qcom/gcc-sdx55.c-
drivers/clk/qcom/gcc-sdx65.c-
drivers/clk/qcom/gcc-sdx75.c-
drivers/clk/qcom/gcc-sm4450.c-
drivers/clk/qcom/gcc-sm7150.c-
drivers/clk/qcom/gcc-sm8150.c-
drivers/clk/qcom/gcc-sm8350.c-
drivers/clk/qcom/gcc-x1e80100.c-

I presume these changes should apply to all of them?

(sidenote: 660 has a PCIe GDSC even though it doesn't have PCIe.. nice)

Konrad

