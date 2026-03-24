Return-Path: <linux-arm-msm+bounces-99646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACx0IwGDwmlneQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 13:26:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0913082F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 13:26:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F35F7300D56C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 12:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BD813F20EE;
	Tue, 24 Mar 2026 12:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="A3SqcbRM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113E83ED5B1
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 12:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774354467; cv=none; b=Iz3XmslZNm6o68jAcZjZ9BcFlRxYIeuw7J2vVYIOSCsskQUn8TwGPOqGIgR+KYUb9+g2qwtIEiEc6Q89DeCSIdXTUpMKTNnjN+kkI9arm0HdFN7Wq4c5yGrFZ9T5Pb0kVyDCUNxZOvv7BNuYIXVJn85vVcOG1aJM35wKPlJUKz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774354467; c=relaxed/simple;
	bh=ePFojS3VN4TYjswFF1H/vsOELMruzUnwM+ulPPFqYlU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=GeI82cMgLX38g+CJ/IO0d8O+2ZyIt/c/7zfvsXvJFyONQVyUAQ5A8oY3+Gv94r1TBpGgEX41nrBrnmu1i8rY0wv1pJFb+F/jrlr0FLXXwOjv7XDo7CuWaXFGBTDOV8pheYVskRY0Hq0yrzdrj9Ow6jNMwQQlazltxP0BCJkAYA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=A3SqcbRM; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b976536806cso804551466b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 05:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1774354462; x=1774959262; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXXUSDv29Wr+jqpebRpdJUk1o7xxVpUgOqnq7T//G98=;
        b=A3SqcbRMcxN2ukdTmfpw1vvI5obMLiQsQM/0jRUNejMc90J0tOPOTSq9frDS9aJ24j
         H3XDcFA4oQs0YcY4AeLLwfAC6DB8r9/xIe3Lm1xt9ZavT/3h69yOwDS/HB7twS7HcM+M
         m5DVKWDMYJgCSnTZbHGXI2L9TMsfL2Uj/DR08VjpMdaqxS9mwmJcS97oZED0U1gx+Z+g
         caDqv84YecWFJJraKi46ENthoftllX2HQYytnBCM4kw70prZtJ34YF2aRTy9VZzbwWIj
         ag03bwwBbudPeRx8f5F26mcBbkf9ZS0Slwmjwm8b/VuwIcw/0eV5AajyACjQJmkgTpqm
         UIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774354462; x=1774959262;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AXXUSDv29Wr+jqpebRpdJUk1o7xxVpUgOqnq7T//G98=;
        b=TTc4PsVZ46LchEYk2TXazMqwleO4M5tGmDZpqIIAID20cGC5a8gsx5lM3Ddo2uzsWF
         2toSrkk1gW4lvczgKN22bJTvzpkujk7ug5VQS5dpozxLivomT+tviyCiInGbWCMoNihz
         PNsypwCJrWXOvY7P/KT2WEsuj0GMjk1nVIgWRy8A5E1IKN6b9TSLynvT/DFP0bjgKR69
         T0LbjTpvYpI3oxlZL1UOJWJm5uEHsn9XD9uwTu/Nx71vmH9rkKpr+0vYPG2bSWbvTcuP
         A56RgJNC+Bga/m8UKt16XeHx0BvjgrGEULg7gBD/H7d8FADvoeXr7lI4gYym9Xf5uIec
         ktZw==
X-Gm-Message-State: AOJu0YzLal3RqfcvK1e0Debrvg/Uu8R962MjRzDhxJiB272KyHfMWtUa
	2vAkkkZN9xPLirk/9Ab/8xNKCG5JlbdfqUx0Z1vtIWTJq09aOrr876aHvM2JTRSj3xY=
X-Gm-Gg: ATEYQzwNV4s/i4tEPU9hOnmnImqOoR8d0rQWr2nof6UoMseu3SX3W+pWypsgORvRtTg
	qrIGBCmDu5WfhVaFRKB2BE13t/t8UnhXjd2Sc2Y8eY7Jb2z3pdk/kZfS8gbHtTHadzbet5SVobO
	bh79jrwkGdNf1afccOEiHAGp2NihQe8WS/KRk0gjpBQ771LQ6cpJZOPMnwLZVQmPW2BKPp17sSs
	1x8ZQqjCFNLjJ0wd2K+Oilj6Pw351AQZNSKcT9e+G/iqA9tQbl74vkb3LvP1L553izQU1TceoNO
	1QKCQbWMAfHG+FwR6OWZUrMeunwEW9UyukrUp3DB1+hylPIcNSmvkO6ZxYdLnPI88cOKP8oeYXA
	aISJ5yE2C05r/zFWEN/qAn7pZThgBM7KrUcZdlR9gJZY1t/4w1Fpj0AIC2iHtnIt79X/GeUDVSY
	vjqSTe/tY5oHQfs9iWvsG54HTto190NNhjgMJgI77UYLAvOoJk2M7TZ4FsM1851OBk3+Wc
X-Received: by 2002:a17:907:3309:b0:b97:860c:de51 with SMTP id a640c23a62f3a-b982f3d7e3amr746990866b.43.1774354462103;
        Tue, 24 Mar 2026 05:14:22 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f439d1sm634915666b.13.2026.03.24.05.14.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 05:14:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Mar 2026 13:14:21 +0100
Message-Id: <DHB05UJMTAVN.17X2QI6XGHB37@fairphone.com>
Cc: <linux-arm-msm@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Brian
 Masney" <bmasney@redhat.com>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 6/9] interconnect: qcom: let platforms declare their
 bugginess
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Georgi Djakov"
 <djakov@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, "Luca Weiss" <luca.weiss@fairphone.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Brian Masney"
 <masneyb@onstation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260324-msm8974-icc-v2-0-527280043ad8@oss.qualcomm.com>
 <20260324-msm8974-icc-v2-6-527280043ad8@oss.qualcomm.com>
In-Reply-To: <20260324-msm8974-icc-v2-6-527280043ad8@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99646-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,fd922800:email,fairphone.com:dkim,fairphone.com:mid,qualcomm.com:email,fd900000:email,0.0.0.0:email]
X-Rspamd-Queue-Id: 8C0913082F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue Mar 24, 2026 at 1:10 AM CET, Dmitry Baryshkov wrote:
> On MSM8974 programming some of the RPM resources results in the
> "resource does not exist" messages from the firmware. This occurs even
> with the downstream bus driver, which happily ignores the errors. My
> assumption is that these resources existed in the earlier firmware
> revisions but were later switched to be programmed differently (for the
> later platforms corresponding nodes use qos.ap_owned, which prevents
> those resources from being programmed.
>
> In preparation for conversion of the MSM8974 driver (which doesn't have
> QoS code yet) to the main icc-rpm set of helpers, let the driver declare
> that those -ENXIO errors must be ignored (for now). Later, when the QoS
> programming is sorted out (and more interconnects are added to the DT),
> this quirk might be removed.

For reference, these are the errors I see on fairphone-fp2

[    5.534806] qcom_icc_rpm_smd_send mas 8 error -6
[    5.535010] qcom_icc_rpm_smd_send mas 8 error -6
[    5.535218] qcom_icc_rpm_smd_send slv 16 error -6
[    5.535445] qcom_icc_rpm_smd_send slv 16 error -6
[    5.535754] qcom_icc_rpm_smd_send mas 2 error -6
[    5.535909] qcom_icc_rpm_smd_send mas 2 error -6
[    5.543665] /soc/display-subsystem@fd900000/dsi@fd922800: Fixed dependen=
cy cycle(s) with /soc/display-subsystem@fd900000/dsi@fd922800/panel@0
[    5.544067] /soc/display-subsystem@fd900000/dsi@fd922800/panel@0: Fixed =
dependency cycle(s) with /soc/display-subsystem@fd900000/dsi@fd922800
[    5.548238] [drm] using 192m VRAM carveout
[    5.560881] msm_mdp fd900100.display-controller: [drm:msm_drm_bind [msm]=
] VRAM: 70100000->7c100000
[    5.561454] msm_mdp fd900100.display-controller: bound fd922800.dsi (ops=
 dsi_ops [msm])
[    5.563093] adreno fdb00000.gpu: supply vdd not found, using dummy regul=
ator
[    5.563624] adreno fdb00000.gpu: supply vddcx not found, using dummy reg=
ulator
[    5.563756] adreno fdb00000.gpu: [drm:msm_devfreq_init [msm]] *ERROR* Co=
uldn't initialize GPU devfreq
[    5.564152] msm_mdp fd900100.display-controller: [drm:msm_gpu_init [msm]=
] 3.3.0.2: no IOMMU, fallback to VRAM carveout!
[    5.565468] msm_mdp fd900100.display-controller: [drm:a3xx_gpu_init [msm=
]] *ERROR* No memory protection without IOMMU
[    5.566035] qcom_icc_rpm_smd_send mas 6 error -6
[    5.566235] qcom_icc_rpm_smd_send mas 6 error -6
[    5.566443] qcom_icc_rpm_smd_send slv 16 error -6
[    5.566654] qcom_icc_rpm_smd_send slv 16 error -6
[    5.566863] qcom_icc_rpm_smd_send mas 2 error -6
[    5.567072] qcom_icc_rpm_smd_send mas 2 error -6
[    5.567573] qcom_icc_rpm_smd_send mas 55 error -6
[    5.567869] qcom_icc_rpm_smd_send mas 55 error -6
[    5.568078] qcom_icc_rpm_smd_send mas 56 error -6
[    5.568287] qcom_icc_rpm_smd_send slv 79 error -6
[    5.568495] qcom_icc_rpm_smd_send mas 56 error -6
[    5.568707] qcom_icc_rpm_smd_send slv 79 error -6
[    5.569199] qcom_icc_rpm_smd_send mas 56 error -6
[    5.569486] qcom_icc_rpm_smd_send slv 79 error -6
[    5.569695] qcom_icc_rpm_smd_send mas 56 error -6
[    5.569905] qcom_icc_rpm_smd_send slv 79 error -6
[    5.570292] qcom_icc_rpm_smd_send slv 78 error -6
[    5.570722] qcom_icc_rpm_smd_send slv 78 error -6
[    5.571147] qcom_icc_rpm_smd_send slv 78 error -6
[    5.571575] qcom_icc_rpm_smd_send slv 78 error -6
[    5.572034] msm_mdp fd900100.display-controller: bound fdb00000.gpu (ops=
 a3xx_ops [msm])
[    5.572543] msm_mdp fd900100.display-controller: [drm:mdp5_kms_init [msm=
]] MDP5 version v1.2
[    5.600817] msm_mdp fd900100.display-controller: [drm] no IOMMU, fallbac=
k to phys contig buffers for scanout
[    5.600893] msm_mdp fd900100.display-controller: [drm:mdp5_kms_init [msm=
]] Skipping eDP interface 0
[    5.601365] msm_mdp fd900100.display-controller: fall back to the other =
CTL category for INTF 1!
[    5.607380] [drm] Initialized msm 1.12.0 for fd900100.display-controller=
 on minor 0

Regards
Luca

>
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/icc-rpm.c | 17 ++++++++++-------
>  drivers/interconnect/qcom/icc-rpm.h |  3 +++
>  2 files changed, 13 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/q=
com/icc-rpm.c
> index aec2f84cd56f..23a1d116e79a 100644
> --- a/drivers/interconnect/qcom/icc-rpm.c
> +++ b/drivers/interconnect/qcom/icc-rpm.c
> @@ -204,7 +204,7 @@ static int qcom_icc_qos_set(struct icc_node *node)
>  	}
>  }
> =20
> -static int qcom_icc_rpm_set(struct qcom_icc_node *qn, u64 *bw)
> +static int qcom_icc_rpm_set(struct qcom_icc_node *qn, u64 *bw, bool igno=
re_enxio)
>  {
>  	int ret, rpm_ctx =3D 0;
>  	u64 bw_bps;
> @@ -222,8 +222,9 @@ static int qcom_icc_rpm_set(struct qcom_icc_node *qn,=
 u64 *bw)
>  						    bw_bps);
>  			if (ret) {
>  				pr_err("qcom_icc_rpm_smd_send mas %d error %d\n",
> -				qn->mas_rpm_id, ret);
> -				return ret;
> +				       qn->mas_rpm_id, ret);
> +				if (ret !=3D -ENXIO || !ignore_enxio)
> +					return ret;
>  			}
>  		}
> =20
> @@ -234,8 +235,9 @@ static int qcom_icc_rpm_set(struct qcom_icc_node *qn,=
 u64 *bw)
>  						    bw_bps);
>  			if (ret) {
>  				pr_err("qcom_icc_rpm_smd_send slv %d error %d\n",
> -				qn->slv_rpm_id, ret);
> -				return ret;
> +				       qn->slv_rpm_id, ret);
> +				if (ret !=3D -ENXIO || !ignore_enxio)
> +					return ret;
>  			}
>  		}
>  	}
> @@ -361,12 +363,12 @@ static int qcom_icc_set(struct icc_node *src, struc=
t icc_node *dst)
>  	active_rate =3D agg_clk_rate[QCOM_SMD_RPM_ACTIVE_STATE];
>  	sleep_rate =3D agg_clk_rate[QCOM_SMD_RPM_SLEEP_STATE];
> =20
> -	ret =3D qcom_icc_rpm_set(src_qn, src_qn->sum_avg);
> +	ret =3D qcom_icc_rpm_set(src_qn, src_qn->sum_avg, qp->ignore_enxio);
>  	if (ret)
>  		return ret;
> =20
>  	if (dst_qn) {
> -		ret =3D qcom_icc_rpm_set(dst_qn, dst_qn->sum_avg);
> +		ret =3D qcom_icc_rpm_set(dst_qn, dst_qn->sum_avg, qp->ignore_enxio);
>  		if (ret)
>  			return ret;
>  	}
> @@ -509,6 +511,7 @@ int qnoc_probe(struct platform_device *pdev)
>  	for (i =3D 0; i < cd_num; i++)
>  		qp->intf_clks[i].id =3D cds[i];
> =20
> +	qp->ignore_enxio =3D desc->ignore_enxio;
>  	qp->keep_alive =3D desc->keep_alive;
>  	qp->type =3D desc->type;
>  	qp->qos_offset =3D desc->qos_offset;
> diff --git a/drivers/interconnect/qcom/icc-rpm.h b/drivers/interconnect/q=
com/icc-rpm.h
> index ad554c63967b..7d1cb2efa9ee 100644
> --- a/drivers/interconnect/qcom/icc-rpm.h
> +++ b/drivers/interconnect/qcom/icc-rpm.h
> @@ -51,6 +51,7 @@ struct rpm_clk_resource {
>   * @bus_clk: a pointer to a HLOS-owned bus clock
>   * @intf_clks: a clk_bulk_data array of interface clocks
>   * @keep_alive: whether to always keep a minimum vote on the bus clocks
> + * @ignore_enxio: whether to ignore ENXIO errors (for MSM8974)
>   */
>  struct qcom_icc_provider {
>  	struct icc_provider provider;
> @@ -65,6 +66,7 @@ struct qcom_icc_provider {
>  	struct clk *bus_clk;
>  	struct clk_bulk_data *intf_clks;
>  	bool keep_alive;
> +	bool ignore_enxio;
>  };
> =20
>  /**
> @@ -136,6 +138,7 @@ struct qcom_icc_desc {
>  	u16 ab_coeff;
>  	u16 ib_coeff;
>  	int (*get_bw)(struct icc_node *node, u32 *avg, u32 *peak);
> +	bool ignore_enxio;
>  };
> =20
>  /* Valid for all bus types */


