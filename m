Return-Path: <linux-arm-msm+bounces-106422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMUKBcmd/Gn3RwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:12:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7D54E9E28
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 16:12:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 67CE730074F6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 14:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 607DC3FB7D9;
	Thu,  7 May 2026 14:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mwhIjCFl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IAC1hn9S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD66388E61
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 14:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778163137; cv=pass; b=cE97rOECh8H6AM04fdzaGmBn9SA0mKI2aGtC8QJkFGkbRVSwqPcAMrIiuLLPvejuDyTwK6bcOuehbP9JdmeR10EjBePCex27d19wTHXR9yhf9cKz0GSj+ML6TPra8A+05ZiJ0c3cX2c6rdvYPq78zmTBGKG+pqPa0WtteziQYzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778163137; c=relaxed/simple;
	bh=YDEz/HqlgT2mzMp8AOX3hhutHXAm5UI6pWslhh7kjlo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SV8URJb4MGdG+S2b8D8aYiGklovFchqIVIlmtUfxyRwUc4NRp+/MLugzCoo+4L9sd29BprF3K8tAIg7Rzn74PZNZNwfmNmJqoZgs/mGsRwIBMTDUpN0hG36ucMBUwRV/cYPPNgWYoewace9gHCXNLChrUYSLIrcvt4cboB5dYy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mwhIjCFl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IAC1hn9S; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647BpaHt3156914
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 14:12:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=ITASyWtze482haPnIkil8QJ16Tn75RV5cHgG/8SP38Y=; b=mw
	hIjCFlAADRB4EQu1PsxvhkWXj++PDxFddKi6BpOGlPqm+c5q/K8g11sZFroe0kbA
	aLrzZ2+uMMMUBqCf2r+2WTpPqU6zZAbASifDUhuwoX/BTXLMlIJ1aHwNxR4xCLJx
	qOAB+OUj3nnAoftesJdhTkB9eWwrjqRoaXGwmQBTh/4CUlZbXNn114DxPvzlgcJe
	uBKuanjqJrU+boda+TdeP+K72lHPUzAXCKW1cmPUc7O/OjbGLc7HzsaQaPAD7YoD
	4oh0n4Epu3NHDkaQwggX4BRSGC1yOQIC7iVdCfDta3ZxXZPjPY1RULUznlqLGIqj
	eDD3tWAKscsCJ74DQXwA==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0mhf1xeh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 14:12:14 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-42343e87c3aso716772fac.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 07:12:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778163134; cv=none;
        d=google.com; s=arc-20240605;
        b=ThHvO8nBtBN3SQ39dt47vUQ/9MSkoTH9Grfgh1syKQr4Uq8Q1oWavIj8lh6PxtotB1
         6xRlgiAlX/7tmZfRzwEqegJY27sn/5Pke38gzSOU1QWQLDQmvOe0D+rN+5FY8yRqhpqi
         z4C1jNwid+mMiWeiSahNoOxAGY+G8Qe4boput7e/tE1npNaUrBk8HCg1QIMB3bMPh7/H
         IlZr1K8O24eFFnnl3YNRcv1Jo9L2FCPQMp56hrsDTnPMjGLMk8gLqRkX9i84UktmRgwC
         MOWOWVP3m2R2TuDtiP3Pz9sDis7yXghCAe2HA/E74Wgp2RkfwKzcayVIC+AvQuKdNKGa
         j/1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=ITASyWtze482haPnIkil8QJ16Tn75RV5cHgG/8SP38Y=;
        fh=1RB/PEhs8nzrUHhg+iAGTscQJgtmlXDwDbWvBqDZcg8=;
        b=bWJ6txW5NgeAhkoGbGLtnwFbH1YhNIMYynjSqGlyJOI/6Y5u31xmIyT8pNC2LiEud2
         XPsEmQWLDl1l44d4IV19kSNodxiHyyMcdnccb/kGvLgMwcmEY0EcW4fzpvy44vvfUdbe
         CADNgINfTadd45/4mo9tZoJ0pLsr7lwEaSEToCW4sCjr2qgIvgFdGyR+MOH9UpvHqj3S
         skiOBnc+3itw7AJQd1ZczYdBTD/d8WcmNvDc0gSgzcCflLcR8WgP1mKxTJav0IuJNvPY
         KzAMyqAqO7mHxsauQYR/cGqz0PfwxXif0leaLROrA3y+14egjfy48Fll+4o8eOHFfin8
         7vDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778163134; x=1778767934; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ITASyWtze482haPnIkil8QJ16Tn75RV5cHgG/8SP38Y=;
        b=IAC1hn9Snb+wxQK4o+i+Ekx64sxkGCIx88iF0xAL+jljg5OP8h4mYnJq/g+bMD0yy9
         /zPtaNq0ucTiBx3dOqLFJ9ZT6ygTeDl0IWTSP4W0DDzo+zrDs7INUAXVt7quuCiEcgSA
         OeutZJgIxPsxvo/hC3j/jPq5F2ojuMHkKXSUcdcYXx+/fIW5HTCR1JnE+Ev4PoFfCFdU
         tsiOmHFAL8zZQShUQjLO6NIBApB8HG1L5fqadj53eGySWXm1z6o+rSz5BbIPwSi23OAh
         bLg1P2y8OWf75jVKhVr4694AfrN7rSi6cAAhQIQYrR/SQSPp3n8/WcAMHzqIwYs6BRD9
         GIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778163134; x=1778767934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ITASyWtze482haPnIkil8QJ16Tn75RV5cHgG/8SP38Y=;
        b=TlBx/OWvdIN9SpWz7UH53cLgIsEs3bz0mfNOLeti43hwpBEWqtbE0z+BgZrNUouJAZ
         jegGlRJXDKbDVKCs8N69DDR9xqMw69AdtpmgbW+7C18Cc0WLmtSCXFSyD8HrVsfwcuzn
         cgeAVPsOwS/LJhQpSa7OS//h328GDfyn4RjlMTQyQGS8bCmTKRnkUwAnXuNvxzyBGtEb
         KrMcdJ8mIe8L+oOkZIRFXXEk9r268ZyzuDhRMNbCXYSNVZfqBccwpgtE7QR796g+wE8C
         CS35+/JaepQmHyGvPcqacs4yp3JEowSVw2X36uIU1ulcUjSf/GkjKnKIgAmWxPhOBClk
         /rnA==
X-Forwarded-Encrypted: i=1; AFNElJ8/jHeqa+3QGM7EeW0IuW9MMuH6DU1Z5dEyxII2niMXsQfhkCoRm61nKqUzwprl87Q8bbFIHsXDRMfGEwZB@vger.kernel.org
X-Gm-Message-State: AOJu0YwbOAyhCn/sk5WXyUn99SQv5mELECWxIKFVqfQ+FdrJ47bQIOJ3
	pnNfp+NYFxbi0B0WB4MSlZaCAZqBGwhUkueSNnaqEOMIyBi9tfG1TZ9EzNBgVGP6ZWPNfqNWrWC
	tL6j5uMinWuEXC7Ga/Lw0SpPMHp2encUxnT/EfvLm8UlEUE4bnLdVZXO62Y5wYO56A74ljm29vL
	N8c6YggDKs4t2at3xy7TxzfKCxlgEkaM6C0Gswq403DFA=
X-Gm-Gg: AeBDievhfrE8hv5csIYWWADUFHC25Et2mdvZZBB1fFujZUWTR5H1fUeEdBMos0+puYR
	zpn7tWlHrOKGfjv2+bAYp8QocVX9ncmRkNN248tYxLckcjygiE1hyhaoieFu4shjj/AGKDbBNTu
	KBSycbRJEKVtysc4j9t+7oFHZTdQCFguhKhvw7Mt6WOqFnO0xcPD4mIDJFLMm9EyVHIByzrDql1
	zSVdtXxCQvnrwhPTKNwGSiOcGWoQyX+w8bxpmTqlvP/fMCD
X-Received: by 2002:a05:6820:809:b0:694:9f15:f050 with SMTP id 006d021491bc7-69998d14651mr3951927eaf.28.1778163134125;
        Thu, 07 May 2026 07:12:14 -0700 (PDT)
X-Received: by 2002:a05:6820:809:b0:694:9f15:f050 with SMTP id
 006d021491bc7-69998d14651mr3951898eaf.28.1778163133650; Thu, 07 May 2026
 07:12:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325-qcom_smmu_pmfix-v2-1-ba769a6ad0be@gmail.com>
In-Reply-To: <20260325-qcom_smmu_pmfix-v2-1-ba769a6ad0be@gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 7 May 2026 07:12:02 -0700
X-Gm-Features: AVHnY4Is6EZTha6Wq3xD-jFuVZhC7DTDiI_bwm7HnmP4foPGflVn99bdaEXp8Gc
Message-ID: <CACSVV01+yL+fm7oPVp8xQ=XXxvYHq4U18t9Dg0b4g_4H-JeAXw@mail.gmail.com>
Subject: Re: [PATCH v2] iommu: arm-smmu-qcom: Ensure smmu is powered up in set_ttbr0_cfg
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE0MiBTYWx0ZWRfXxU/tk0NhCR0B
 q+vtvlpYY59OKp3WfKW5jbGCkE+k8seZdQWwvmtB+8AdUx826uex2O6wqvWSpp+gDq1OTyYY7nF
 Gj1f7TqIMvheUK6OCZwoZOVKNqdWApOWHVlBSvbocsDbZRXpms1d2y/dH+AOtKo0p8Nl1vYK+Bg
 H6obBhYPPyeLmoI7wkFKi3a/Q6kXPxkIkizwUd3egVfSj2TlsOk8aLdg2xKb72Y/UbKyO1wi7oC
 Y21vugfzHAbcBhnwxMUoCVDYELGKFggUaJ6Nzq7UEiuIs8rsp9fSvDQP/0YY6B6e0yK2WUl04a3
 TN+u/x5/TdfHExLxqJI9qO8cv7TWMgg/kE7JkoTRmfSby1w4f2if/q1Us8MnjO1ImqI6n8U/SUZ
 vsr8IhxVGuQIQrbDo0Up9jEZFLc4z/SR8ab0Up13qlkO1lNHo21tfMJnMx5C90I2hK1p/v/jJ7i
 fjhawwXSE3bbjrHc/CA==
X-Proofpoint-ORIG-GUID: JBECShlk8T51_V6934YmirmIAeRX7bDG
X-Authority-Analysis: v=2.4 cv=SuagLvO0 c=1 sm=1 tr=0 ts=69fc9dbe cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=KgnJN8VTlqKxrJ66Oa4A:9 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-GUID: JBECShlk8T51_V6934YmirmIAeRX7bDG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070142
X-Rspamd-Queue-Id: 0A7D54E9E28
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106422-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:replyto,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Wed, Mar 25, 2026 at 2:11=E2=80=AFPM Anna Maniscalco
<anna.maniscalco2000@gmail.com> wrote:
>
> Previously the device was being accessed while potentially in a
> suspended state.
>
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>

Reviewed-by: Rob Clark <rob.clark@oss.qualcomm.com>

> ---
> Changes in v2:
> - Simplify patch by acquiring device just around the call that needs it
> - Link to v1: https://lore.kernel.org/r/20260210-qcom_smmu_pmfix-v1-1-78b=
7143ac053@gmail.com
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.c
> index 573085349df3..cab7d110aaf5 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -231,6 +231,7 @@ static int qcom_adreno_smmu_set_ttbr0_cfg(const void =
*cookie,
>         struct io_pgtable *pgtable =3D io_pgtable_ops_to_pgtable(smmu_dom=
ain->pgtbl_ops);
>         struct arm_smmu_cfg *cfg =3D &smmu_domain->cfg;
>         struct arm_smmu_cb *cb =3D &smmu_domain->smmu->cbs[cfg->cbndx];
> +       int ret;
>
>         /* The domain must have split pagetables already enabled */
>         if (cb->tcr[0] & ARM_SMMU_TCR_EPD1)
> @@ -260,8 +261,16 @@ static int qcom_adreno_smmu_set_ttbr0_cfg(const void=
 *cookie,
>                 cb->ttbr[0] |=3D FIELD_PREP(ARM_SMMU_TTBRn_ASID, cb->cfg-=
>asid);
>         }
>
> +       ret =3D pm_runtime_resume_and_get(smmu_domain->smmu->dev);
> +       if (ret < 0) {
> +               dev_err(smmu_domain->smmu->dev, "failed to get runtime PM=
: %d\n", ret);
> +               return -ENODEV;
> +       }
> +
>         arm_smmu_write_context_bank(smmu_domain->smmu, cb->cfg->cbndx);
>
> +       pm_runtime_put_autosuspend(smmu_domain->smmu->dev);
> +
>         return 0;
>  }
>
>
> ---
> base-commit: 50c4a49f7292b33b454ea1a16c4f77d6965405dc
> change-id: 20260210-qcom_smmu_pmfix-2aead2ba4e20
>
> Best regards,
> --
> Anna Maniscalco <anna.maniscalco2000@gmail.com>
>

