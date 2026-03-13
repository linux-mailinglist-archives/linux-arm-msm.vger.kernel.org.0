Return-Path: <linux-arm-msm+bounces-97290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gK/YBmVys2kEWQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 03:11:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF16327C930
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 03:11:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 221AF3016295
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 02:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3793233A716;
	Fri, 13 Mar 2026 02:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jtoHtrl8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SbRPW1iz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAD533C53D
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 02:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773367907; cv=none; b=lzzusV6vXyos5hYXBEKmX7DtGP48R+m7B73wSpZbz+3jjDE1FP0gOEYTfzQ+kKTEJX2pL7pA9vbznUzaGwGTgm+4OQhu8GHA+xIgqONtTKv8IL+kb4nb8shFC2LPi8XFKedVtsqjGJ2xskJaAuEGzYo/BCCjsZ/en9rxaQ0TLqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773367907; c=relaxed/simple;
	bh=iEHWAOMWK9NBZlmVkzkSZR2rVMRLUZHQpZHVOg5mmwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ewt8BG5Wm1FJEJDxAmFu2uYkwEDqwttHyTXPyQDe/hPmtMvX73zn7ToSFWd6T8cihgJr/wUDOkh/hNDPEuLu6iBTGNtmV9+QdXcv9HpAuuyeE6z8yyRaPcS9SGxaeeOdVsC1KXarjmTOT0D3tVy1i6/selmPD39qEzGZXW2MMSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jtoHtrl8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SbRPW1iz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CHTo274132443
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 02:11:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Z8nQMK/dyX/NcjJbrlQ377Lv
	LK9n7wIl6HwnSAm5xgg=; b=jtoHtrl8plFtSfni9vWe48+HdC9NYBxh3bJ5jblT
	1XbNfJg8niVlsX2hdPV5ZcRYwBN3cqVoVr2Q6p7Nw9M9U9brVSk+eap0wNUGvqAU
	TRoidlBW8PVk2VJK0ZHSfNpbNfy76gnQebtNze7AMNUOWhEjcToL/1sph+Snt8g3
	vvQ08ohgHwKJYD6HflVtBVUto72+giBJ2VZPUDEvylw3etRDClkpgMEGFbOzo1QH
	dSVx1kEZ64xUbggvDBWrs8p3+UM7eOPv50lifmfdlV0qFpIJOLI5/cOuToE3LWh9
	p+ldJgoUNSwd2AsuwBFa+UwQ7WwT+ClqNvp5LqWMZunp4Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4w4546-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 02:11:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50937c5b742so67416161cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 19:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773367904; x=1773972704; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z8nQMK/dyX/NcjJbrlQ377LvLK9n7wIl6HwnSAm5xgg=;
        b=SbRPW1izwaPnX/ja5Jq+Gl8tTOItLElICkHYIB6jCIGu9Ko53UPSji8oalocta1MEZ
         FASkw4IvwvOw4u1EaaV3NQPvNuKPHt4Enk28FaN2Wj2gTVAIsNzXad1bC9gT0mvLttkF
         k2mq502Y69iflIGIHYrEAMPwtNq3G6rZcWLSpXdK2xt1Zg5ThhNjSBaiQf8BkBS6unXT
         ObvzrWz1xF8a0I08ogg/xvB+OEX1nxhUNsjCJPamYCS11TbnJ/WzRPIwQzbTBikKIak3
         z7t1R0Lpy+T/gz/OKsVmPzP26nDZb/g49HCNpI6/vZ0Xjy3Z/oEXUm34I5mMHOz/e3GD
         k7Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773367904; x=1773972704;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z8nQMK/dyX/NcjJbrlQ377LvLK9n7wIl6HwnSAm5xgg=;
        b=KqMnPMOW2feTO82CB3zP+VNSDh8jGXTNPXB4i552Qjo6BgayCBr7jrClyztFFLv67+
         1t5taSJ9vWdYpr5CzRZfyEbPEuZ3dkfWvBc2RQCLUEI1XYhd/gK1ps9Ibn3LMA1zbQI6
         sVY1UU02LKobTY09Ek2XrgXA3qp+lGqckfEi4x2CRCPPz6Ab36Y98NnBlZsz4fIDoWJD
         BG2g2entsNkXT37d3g8MNpB1aN2Q8B5UFQMedecXaSN0/dk06jamlsQtSG45tf93PY01
         DN3LFIStw+EB+cvL4vQLohQJn37V+5YVs4mXyelCVoSRaUsBR16E/9ZNoH/3R7nOUz4w
         2NZw==
X-Forwarded-Encrypted: i=1; AJvYcCV5Dx2IL/lNzMz9IC13PZ0zkwBvoTgZWBG6/95a8fgIyU2XvxlbtDNVLQKbj9eW0/WgmentnzddyWRjJaXd@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm8cFSw0yTNMaXPp5uUPCNbDgRP7tbgfI4iuXd5bPq4N5THU6X
	GpKsSWmgHblfpdpJD9nLzhydGHon3UVHDTVxsJuTbpqlmmyap/dLsv2vZbMM1XKfCjlC5OhGvry
	rBpUUdVxycHaEJvFtixvGuDAeqACLYSDp+Uwx8qo8hvHE2Jxej0aysEMqjkaTkSGVm5MW
X-Gm-Gg: ATEYQzzHvDtouqVLDKYdAu9si2fvxBT2+bXStVoq7BAprpHCPcDLgFl5nqDjPz1ltXU
	7Sqsrg1wNS0EX6eYBYAbNshGycitJa36B4BV3fL7+zFEciJnXhxENMn2ClsCCgXICLK/77TOtZC
	cMYJcOjEmRBvsvTjRksXW6BC8PhTuQl9rXVGvWC7NGfZWSXd38APFPXEEk+NXMKQ9ree2YhyaMv
	+zQUoTRlbAVXeq01xd0xCXuZ4NfXeyE/f/PGsqW5EdZMnfQI1MJTGPgrNv4agaRJinWt9UFoxLH
	/7QfujUQz+0xp2J1RPik+6nnCwLWS6PqrdJZd7RVWHZl2H3ZZGaj44wl8IirmZbJ8/irVoVm9Wz
	IxH3Xu8VhQNmD6bCqKJHDXhgFvlnWEi1qSDRi4Im4HBwXU+AxEemiNys9tfskd2nIdCTxZY98MM
	HJFLbo4RQkFW24CELCR8e7KAp48A0EQniHhVw=
X-Received: by 2002:a05:620a:2549:b0:8cd:98c1:763f with SMTP id af79cd13be357-8cdb5a4abfdmr257100985a.11.1773367904052;
        Thu, 12 Mar 2026 19:11:44 -0700 (PDT)
X-Received: by 2002:a05:620a:2549:b0:8cd:98c1:763f with SMTP id af79cd13be357-8cdb5a4abfdmr257097885a.11.1773367903551;
        Thu, 12 Mar 2026 19:11:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156162c12sm1222960e87.52.2026.03.12.19.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 19:11:42 -0700 (PDT)
Date: Fri, 13 Mar 2026 04:11:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: Re: [PATCH 1/5] arm64: dts: qcom: x1e80100: Remove interconnect from
 SCM device
Message-ID: <bnaxwhrfeer3n62xp5rka4pq4mz6y5xxwsin2vavc5zcj3ymxj@splrj22ki445>
References: <20260312-hamoa_pdc-v1-0-760c8593ce50@oss.qualcomm.com>
 <20260312-hamoa_pdc-v1-1-760c8593ce50@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312-hamoa_pdc-v1-1-760c8593ce50@oss.qualcomm.com>
X-Proofpoint-GUID: l9Zrj9jisFLe0LHKpb61eBNdUDOA9uz6
X-Authority-Analysis: v=2.4 cv=Cpays34D c=1 sm=1 tr=0 ts=69b37261 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=buI6ytlUu26sYBdjsKoA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: l9Zrj9jisFLe0LHKpb61eBNdUDOA9uz6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDAxNiBTYWx0ZWRfX1ieh5TUbl9GU
 mLrIXbzCYCUD3L1teDgNSJ3sDoPAiRZbQDnNFhfBepoRSsVpwP6XgBMaz2MnXYFZUtGaSzz54qB
 naxTVOs4qZaaHcvC4KnGW8XV/f+jYSQKAIRgJ1Xykgib+j+s1k8O/NG3zdefr1ZUnLARX8X09Xl
 Qj+yh/3+dcQkrTgXKOcBH/IwUbT4Ok7JBelvBlo3o3UeKP0Hl4dfEPVyh5dupvuqVaxe8JItfPX
 2vgeGv0OK+Ufqun1Z641YCjW/a7iFp3wU7Gyr1ywPamACuPPUOR06uBUIpQZcadaVGRQ3/Leu8d
 xPfBYM9BQpKv8hZuXh+lPgFez4aklxQ9X3vfl/8t/WG1xZs9mnX/JU0be2IegPigdzhze0w943h
 jprfNfK45IWbhzYYylXtd2/bG2Beh8x5LYUDwB2/xfE4fm8MNS4EslItLXH4rCCfYmqPFHPWsLh
 Ac2NhDbb/YSaQ4JsRQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130016
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97290-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AF16327C930
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 09:26:35PM +0530, Maulik Shah wrote:
> Interconnect from SCM device are optional and were added to get
> additional performance benefit. These nodes however delays the
> SCM firmware device probe due to dependency on interconnect and
> results in NULL pointer dereference for the users of SCM device
> driver APIs, such as PDC driver.

This sounds like a bug in the PDC driver. It should reject being probed
before SCM is available.

> 
> Remove them from the scm device to unblock the user.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index d7596ccf63b90a8a002ad6e77c0fb2c1b32ec9c8..ebecf43e0d462c431540257e299e3ace054901fd 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -308,8 +308,7 @@ eud_in: endpoint {
>  	firmware {
>  		scm: scm {
>  			compatible = "qcom,scm-x1e80100", "qcom,scm";
> -			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
> -					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			/* TODO: add interconnects */

Somebody will try to fix this TODO, reverting this patch. Let's find a
better way to handle it (which would also fit other platforms).
Originaly this was proposed by Sibi ([1]) to speed up PAS
authentication. Other platforms require RPM or GCC clocks to let the
firmware access crypto core.

One of the (stupid) ideas would be to add a separate SCM (child?) device
which would be used for crypto-related SCM calls. I'd like to point out
that currently we bump those clocks or NoC bandwidth, but at the same
time we don't vote on the CX rail. I'm not sure of the firmware handles
that somehow or not.

[1] https://lore.kernel.org/all/1653289258-17699-1-git-send-email-quic_sibis@quicinc.com/

>  			qcom,dload-mode = <&tcsr 0x19000>;
>  		};
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

