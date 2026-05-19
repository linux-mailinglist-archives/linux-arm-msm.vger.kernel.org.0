Return-Path: <linux-arm-msm+bounces-108498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sID+IJJdDGqYgQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 14:54:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E1B57F13F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 14:54:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A450B3005780
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 12:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FEB14DD6F3;
	Tue, 19 May 2026 12:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j81F/6Un";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="McSGQrox"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B094A13B4
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 12:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779194981; cv=pass; b=gImvESdeI1i13bgd45FKk5UMfeg9IoAV6xVUICRjKj8s+lnZy1FU5fJyc2+k1SZDnaXVvxT/HuVgkl1Wi4cpJFTTDy3nG3wog4VMMV4IEElcJGShdqc0ahsnlWs0AFGI/z5F1MJj8HFfb3U/Ts7gMNMYyi0vjGlOkSVJvNfEYqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779194981; c=relaxed/simple;
	bh=V5Zg1C3oSoD8d/oOBD+crRDyZXzch4ORUXdF54ozY7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O58lIL1iNHkZ+ZAAYzJ/q6Y+zcpogxyD2/lA/h6KTrwtFweebcuJE9sfFxk1QgTBixqLBUzfgldOlcHYMTgUUhtDBHTKpMsK5Vp+bcqLBgxvIGIRjicra055TOjU1RpC6C/HQG8hdoEOAVpDED3WykDWwWEyWgiJXZy1iWfXAOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j81F/6Un; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=McSGQrox; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J7hCph2975577
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 12:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6NmyUddfrYb427GwBagrxr/nluvoaaw+FvwM5JKj3FQ=; b=j81F/6UnrM+ucBBJ
	Dg8VIH5yB14RiqB54X7zwOjOm/rArZLvE+9tNPQG2Tro016LROeua0fjO/eYlH6S
	5Ov7wYe2y5IZbOMKEjK0+uL4Y/ASVVZ7DnGlIRxOSDwVdn4XJA3ZOqmGWa4HXg0C
	n39+sRoLyK2Di6I6c9ZQ1jNLPd0U6BS/yqgpcnE70jFwBJ58W54TWb4sbBlaGmmu
	X221MzJhrYrLRQ2Awr/YmfUFFfuz4sNkund4bCkEwMKkhXKCoeC9yezcPoreHKAb
	5aUSjjkpdutlQ0On9j0jJmNd9ipZqcloRpb7A6voreMXJOH4mTVpof1gBghZPRhP
	I1mIPA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e84v4cgx9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 12:49:39 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8c3bdb60dadso120688016d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 05:49:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779194978; cv=none;
        d=google.com; s=arc-20240605;
        b=l1qrwDApgt3n2vOWx8pmmxrgadJT1sPkN6FdngWZJavQC86DxK6+HLnulJLC3o9Fhu
         mxLZ8GWb2GFVbaObhcCdNx28YkmznmMcRXyjmw0qW2vfdc6LEw3ewmzwGkOiNR1Wd7W8
         Mgha6CKHPpaREy6vvjolhM3Onkty7dO6t/f1uIBi3sKf9URwxMw5qnRATNQroEDSwafz
         N/Kn3SrzXu/Ffz53j4F18JdpXuKnyvJrXngc4NgRqYRCKhzKzzxUMH9pt+VzXckbor6O
         jFoR50sYFvThFLjrAHvdyqbK+KAqNzr+mPlM29TpCzXCPBK6EaNeG0z+OZrWdH/G6l+f
         jNFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6NmyUddfrYb427GwBagrxr/nluvoaaw+FvwM5JKj3FQ=;
        fh=YB4xnzxKCDe3HoHcFV3JGyeZPMsxfll2m0dXOeobQI0=;
        b=ZbqMebu18gLL78SAkT89XydbaSFEKFNVl6qERHK9uH1NS2MZQ8B4m7Jp3kkEoz2EHg
         Q4UfmX+9u9kNGnuSSMbnH335wKgjZQaIlOK6wqgr4GvoTTRexafwMwym5qiD2rhk4iZL
         2Bv/7oGG4sgZfUokf7WNi72jtY6vBAf+c1gSZHKU83A+dxDQSA+kmEXiESXKNn+wL8aA
         bAQcZNbDG3R3pU6jQCICRe+7I9I9Y/gN5htJlRRhmaW3E+vQsSg9EPGrPMSvTk0lVXnZ
         FPCzp/PcFt7PYYXmdYBuuSLF3w0zFezExxukP2h9SosxSFbx3JpRPgZHXCq0iZuivFTg
         G6Qw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779194978; x=1779799778; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6NmyUddfrYb427GwBagrxr/nluvoaaw+FvwM5JKj3FQ=;
        b=McSGQrox/RvcxSQINYDnWMuh4ySbkLWCLH7sr05nG/sM3iVoyfXWjiBJA8DKLOcTDw
         SBjgNogIgVyifkVqp1Owoet35q08fWLvvJJ5YEvtMpu1K3SgjPOBKX/12jXwPJnXCVxv
         s1Q3Oa/t3KDmhNpbQpDemWB/ImbS8uhJdU0Nz2mr6Zy3RYDHMWKcKL2U4/2uCyUNmLtJ
         g5qLJpMI8bRwNTnXcmGq2XVY796ia7lYsMa4CfZNux9QsmLk51635jZmzRMSQoxKeP5e
         +V4C5wU2JjsdCamH+UFXBIFslT4tslXnWAOQWdFVMUvceFilXJLMdNZtxeiaDiWvx5HJ
         G+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779194978; x=1779799778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6NmyUddfrYb427GwBagrxr/nluvoaaw+FvwM5JKj3FQ=;
        b=MdpTddMd92amfP6cVt55ao+rxryxqxGE6Bj7xGjv5QGTfstccjydXHmplnZ2BD1GXk
         prYHNSikBmLXa9OyV2qiMWgwmu7W8QFEmWLnmV7xAdjoxB9LEBAENdXUyCprCD3Huv91
         1DibZ9xJqFoK/Apec6wXBpWwAl1Ca2akXOBl+aIiBD5E9ePteuzyCMOidMnrOGIDg3dH
         gJmPtkxKSXmmgm2ArHdKDaoxNBQzXyxdLSiKSoujsHdFTVFfM34jsqZzLgH48WUq1ctD
         ti9C9mabhOVO7GQ028rHu0zM6Sb5RVSBS0oAzpC0PDkQWKtzWtUhMPXXShVojGCgmXOY
         /VbA==
X-Forwarded-Encrypted: i=1; AFNElJ9/AzpbkAiY9DTC03dxbNDxl5IAM855/7wke2I0PoJiqh0T/RgiZQoSIVYre2aCB7iTm04pnpkYg+5+yKV2@vger.kernel.org
X-Gm-Message-State: AOJu0YzO5HkM0GMXvXXwz+gxQZvmAtUtuhSmrwRjEnGFxPz0b8HRGAOp
	zLAo50/77HEzSz7yLhd9oTlaqSMBjOxzmTGFw49YuLgCUDd1yMqi+MgGsvcZMTLjuZobBFGUo3q
	66o52Cprd8b27EFqYic/PC+d2KYiUi1TQtEp2c9micCEC1biE8jJWlzksgPJSSPHWd9PwhnhwsA
	i1L8lDS5o7siM4fzNvKTF7EkFn7wHFWLkd/GDlHOcsxwM=
X-Gm-Gg: Acq92OHqwaQf5hkrUVfHI7OHRV0QWQh8GM5L6hjFCirHxPKVfzxj4Y1psWT1V5lsWQZ
	jWjQI6J7QlmxwtmwSG2zOH5ZKT9XDhtR7iq6ujkJQOe1flnO2Qu+NBTlGDDagqlSB8+rqBtMhqS
	weBiNM8IBo5GZZO5EQ4nxFL2mXeGs+lqTTIfdUWTKA7yX+o7mxvytlJHtXG8hwV+AVcoKV1OtEh
	zYz2bMJ8Nc3Iv1qUwMudqZmGnUoO1N6JhCodKk=
X-Received: by 2002:a05:6214:6015:b0:8bd:7192:9506 with SMTP id 6a1803df08f44-8ca0f64235fmr283460326d6.7.1779194978161;
        Tue, 19 May 2026 05:49:38 -0700 (PDT)
X-Received: by 2002:a05:6214:6015:b0:8bd:7192:9506 with SMTP id
 6a1803df08f44-8ca0f64235fmr283459866d6.7.1779194977716; Tue, 19 May 2026
 05:49:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515234121.1607425-1-vladimir.zapolskiy@linaro.org> <20260515234121.1607425-5-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260515234121.1607425-5-vladimir.zapolskiy@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 19 May 2026 14:49:25 +0200
X-Gm-Features: AVHnY4JvcMMmko_XU6sC4WGN2U9-8_uZbIyKO4npMY4X1Is11ZZYnAx4UtyOSOo
Message-ID: <CAFEp6-0En1kQ7LXcrSoi9X6fGKLOdXTHZf+SECvUqR114ThB+w@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] i2c: qcom-cci: Remove overcautious disable_irq() calls
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=VJPtWdPX c=1 sm=1 tr=0 ts=6a0c5c63 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=wJ32WsedhRsoF_vvPlsA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: SDb-UjQ972qP7-MbZpCQ70dIffmQDKFU
X-Proofpoint-GUID: SDb-UjQ972qP7-MbZpCQ70dIffmQDKFU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEyNiBTYWx0ZWRfXzuxkPyuzSgqs
 V7NoDk4hwULjGa0CN1Iy9W7jsDbeCB7eXNpgIdB2q6lI3MmTV116n7nm20vb7TnTzXAELsrMFH1
 J3mw3nrO3BLzVHKUZcT8J0zamrUdwuzbU382y4YI1keeMyZaktiS31yYR/JnwVBp/1bcPfzxMoF
 Fi15/YhHAx6nSjnsxbHVJRjzZWV0AmWieG9AmSEZ/Odm4CmdOZ9NY38VyKP/qxbdNtaqYvW6cGX
 ov3YQlUVOZlw4FnNch55ymkYbpaLwHfhBk3+lG1QDhHFUebG6SJWYjkbSjHGog7O/TSWZR68EOC
 vB4euWEEc3+ZdFquP6Z3Lhh4W5qq5tGibrgmTzWw2glZf8xeQZiJfVwoFqI4RiT4CY7gnS+wgfW
 r70wWuCmTeYHcUASpKCyxTFa512I2HK7jqaURxTTaR2Utc1im2VzTzkgtkAV/PhPQH6giMEuUmz
 xw15HyRaqVS1KyEansA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190126
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-108498-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,oss.qualcomm.com:dkim,linaro.org:email,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+]
X-Rspamd-Queue-Id: E1E1B57F13F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, May 16, 2026 at 1:41=E2=80=AFAM Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> In cci_probe() the controller's interrupt is requested using a devres
> managed API, and in cci_probe() error path and cci_remove() it'd be
> safe to rely on devres mechanism to free and shutdown the interrupt,
> thus explicit disable_irq() calls can be removed as unnecessary ones.
>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/i2c/busses/i2c-qcom-cci.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-q=
com-cci.c
> index 2d73903f14d3..4d64895a9e9e 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -608,7 +608,7 @@ static int cci_probe(struct platform_device *pdev)
>
>         ret =3D cci_reset(cci);
>         if (ret < 0)
> -               goto error;
> +               goto disable_clocks;
>
>         pm_runtime_set_autosuspend_delay(dev, MSEC_PER_SEC);
>         pm_runtime_use_autosuspend(dev);
> @@ -638,8 +638,6 @@ static int cci_probe(struct platform_device *pdev)
>                         of_node_put(cci->master[i].adap.dev.of_node);
>                 }
>         }
> -error:
> -       disable_irq(cci->irq);
>  disable_clocks:
>         cci_disable_clocks(cci);
>
> @@ -659,7 +657,6 @@ static void cci_remove(struct platform_device *pdev)
>                 }
>         }
>
> -       disable_irq(cci->irq);
>         pm_runtime_disable(&pdev->dev);
>         pm_runtime_set_suspended(&pdev->dev);
>  }
> --
> 2.49.0
>

