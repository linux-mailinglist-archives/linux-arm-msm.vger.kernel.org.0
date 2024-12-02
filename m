Return-Path: <linux-arm-msm+bounces-39906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1BA9E0781
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 16:49:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67E03168CBB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 15:18:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C0A620FA81;
	Mon,  2 Dec 2024 15:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S3qGzJvh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C5E20E327
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Dec 2024 15:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733152305; cv=none; b=E4KUg0nNSlB6JwS6XmBqVnNeqrZOwUmOVlgmSt87Oudgc6FXZAtG/UvHEf3V9pdqafAmakhffBIDb1RqjVP2NgeZqdvaysmPBHEk9g82/C6E9fGBGgOi0l56+IK0isayobtfETkOSO0pEkJivxzL6FX+S9IOPZHe0s3Pq0iU1fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733152305; c=relaxed/simple;
	bh=TpL0LHs65p56d9EwEFOItEdeR5R3gBOZmwdkCUb8xW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q/ZHZI+ghwPrnTIQEev8m2iBSGUePFI78ixDVPgp/3aq8QMJlzqRdVg8/2iihi7zCrpo63GGitLCa3JNIRqcdr2cwj/VBr3UgA3wX072i9Cpx1a98CnmC0z/9T5wJYK39fIUn5m/cmmwbwa1eWsB4Gi9EQKZDIVSPk2lOIPYxfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S3qGzJvh; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ffc380b1d0so43786781fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 07:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733152301; x=1733757101; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fw7YEoYIbKyZeOPjx3DPUW4jWlQB+qg3r3Sh5MM8ZwY=;
        b=S3qGzJvhtwbfKX+/iXEV5LNFs3ji3FzfWTFFSk391RJ4TazJWbGX00G9hCknid92NO
         6Ple/p2GGhUmBclwRMHcmoSAeAlWU3P8PFoDIzoHDl9Cf4kq8CSbHATmaLZq/WQRnpHb
         wq/WbhhxYOcc/qXSf8M1ivVKP4lxYd4kads8wwTwAV36+8KBRl6m/ijfdKjy0hn3/G82
         ayzEDdq/HGXctFU+fgeSN6ppSvXtQSDF1OEl2UWsKDbm9hE7lDqYEcRhInLvaRlRnqXT
         zDQLJC/qV/uPnj2GTZNbCl/tRUstvlZX34wkBPNGIi7KMkw0Z+TdlQhepPYY8oIYc3Cp
         43LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733152301; x=1733757101;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fw7YEoYIbKyZeOPjx3DPUW4jWlQB+qg3r3Sh5MM8ZwY=;
        b=SuvrxaGGtEU2nD80Bdy3p5U1ph8OWzxV9miFCok4QVQZ983g+OQfl4YKVRFj7/pP5F
         ZaXdysmaPg0SGcLH0W4l2BCOFqLuLMZMOdobk6gfcIZAN5LOOaOlFIEwpsHR6r8g13sv
         xd+hpJcGdRDa+ll6mlZEJX+W7ZfwYUGKK4upjWDQCamzbjTIGl+llWGb1RMsjPDN+CBU
         YwIniF7mwIWV3R843bj48dx8oe9jCU0PPn5FZqGSwEHb5Xo2xYyuaUGQRX9IFE6GY1B1
         cw1i8BxYbSBwPmXrlnENKkq2WXkdrfA7beYSSiL/jssn1SRX+TXdEo0tTL6JkmED1Jso
         796A==
X-Forwarded-Encrypted: i=1; AJvYcCX/EqbzvgQMcKm77maAYfAPjegi0x2F8Pa9ECqNGrFnkfCXsyAgaznTjnRUYgZRka9gzpRwgrRXC1dc0vPh@vger.kernel.org
X-Gm-Message-State: AOJu0YwaKjyjH9Lis1dis3zuoaS20+u9nTUMOo0RfKE7N9PcpR9ooxIQ
	uPMOLR2h3WxAaSiF8vRXNRt4LGJ13N0PnarHSgZKhffsRRGF04nbx5/sMldneYE=
X-Gm-Gg: ASbGncvl+U2nBqZX8oHZ5ri8spetbo+nwywqb/osW+vzWF/vbUWFaxYqjpW8rffg0Oh
	6AvQ04X6qAG9MHTYs1mlV4G1Qy2RGwnMgEcyud3MK+hvJGTlquUiqCj0JUVuu02GN9HzZUauYyT
	VyQheCbHinSm38pFJRxjAspwwJpVrldESnR4MjIdGUsMF79o9wSZtoD/UA3H32WbuaubqA+gU1p
	XNhbW7ntfG1uvHpCdgP3aJ/3imWC30rJ9bkEcZREV/Wu+uC3LYuF6cckXmVzFOzmlCP5o4KI7K/
	uRLOM2BnopW8j6/TTFVDwmBoaPnutA==
X-Google-Smtp-Source: AGHT+IGTOCHVZ8wHsV6r+9tCOEInpxzT1dTiCgbnax192RHUBILvYulxGuD27uXpLfbri9gV662KLg==
X-Received: by 2002:a2e:be8b:0:b0:2ff:4e4b:cbe2 with SMTP id 38308e7fff4ca-2ffde23e3cdmr64660161fa.14.1733152299652;
        Mon, 02 Dec 2024 07:11:39 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfbb915esm13211121fa.19.2024.12.02.07.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 07:11:38 -0800 (PST)
Date: Mon, 2 Dec 2024 17:11:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, "Dikshita Agarwal (QUIC)" <quic_dikshita@quicinc.com>, 
	"Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>, "quic_zhgao@quicinc.co" <quic_zhgao@quicinc.com>, 
	linux-arm-msm@vger.kernel.org
Subject: Re: add venus firmware file for qcs615
Message-ID: <cjbdqixxxu2zrgkakcb44jnkeoktwc3vmtqauejnxjxtycqtnp@7cthmlpy5qx3>
References: <pqoq64hk2jedmqta5fs4ktcadw4getwkgz324vtrzzotcurpaw@zc6dlhbqtsnz>
 <a1bbc1d0-d3bd-e44e-e393-a7ade909a506@quicinc.com>
 <CAA8EJpoDXKbF5cqb_vzE28zjdC6OC66Zxb5j030QXaCe+FUmfw@mail.gmail.com>
 <egdqhgdiqqny57yiauiyekcvhxvebfttyncqoazslzjprwvakz@txvy7wn4vg7g>
 <a259c98c-6c77-1c1e-e428-41c2550f7517@quicinc.com>
 <pukoimsqhck5oymirmgiwad6s3l6frt7xbahp7juhvj3rt4622@wpajx6vyw5nl>
 <rukxa3h72trvqvu6wkxmkp33entybcvxfjlpcjh7odipwds6lq@rt6ferue5nbr>
 <5170f77f-c5d3-02f1-8deb-5d00fef7627a@quicinc.com>
 <magmzevx4cisi5s2ytdtzsqr6klrt6wot6cex3zpxugjspdwyt@qpooycw4b2bs>
 <41f0ebb2-02b9-a83d-6a7d-3dd03fccb687@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41f0ebb2-02b9-a83d-6a7d-3dd03fccb687@quicinc.com>

On Mon, Dec 02, 2024 at 06:20:40PM +0530, Vikash Garodia wrote:
> 
> On 12/2/2024 6:16 PM, Dmitry Baryshkov wrote:
> > On Mon, Dec 02, 2024 at 05:30:55PM +0530, Vikash Garodia wrote:
> >> Hi Dmitry,
> >>
> >> On 11/29/2024 8:05 PM, Dmitry Baryshkov wrote:
> >>> On Wed, Nov 20, 2024 at 01:22:50PM +0200, Dmitry Baryshkov wrote:
> >>>> On Wed, Nov 20, 2024 at 04:40:51PM +0530, Vikash Garodia wrote:
> >>>>>
> >>>>> On 11/20/2024 4:09 PM, Dmitry Baryshkov wrote:
> >>>>>> On Thu, Nov 14, 2024 at 01:31:14PM +0200, Dmitry Baryshkov wrote:
> >>>>>>> On Thu, 14 Nov 2024 at 13:05, Vikash Garodia <quic_vgarodia@quicinc.com> wrote:
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> On 11/14/2024 4:16 PM, Dmitry Baryshkov wrote:
> >>>>>>>>> On Thu, Nov 14, 2024 at 09:06:55AM +0530, Vikash Garodia wrote:
> >>>>>>>>>>
> >>>>>>>>>> On 11/13/2024 8:10 PM, Dmitry Baryshkov wrote:
> >>>>>>>>>>> On Wed, Nov 13, 2024 at 10:50:44AM +0000, Renjiang Han (QUIC) wrote:
> >>>>>>>>>>>> Hello
> >>>>>>>>>>>>
> >>>>>>>>>>>> The following changes since commit 6482750d396980a31f76edd5a84b03a96bbdf3fe:
> >>>>>>>>>>>>
> >>>>>>>>>>>>   Merge branch 'verb' into 'main' (2024-11-11 20:01:00 +0000)
> >>>>>>>>>>>>
> >>>>>>>>>>>> are available in the Git repository at:
> >>>>>>>>>>>>
> >>>>>>>>>>>>   git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git<mailto:git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git> video-firmware-qcs615
> >>>>>>>>>>>>
> >>>>>>>>>>>> for you to fetch changes up to 1e7f65883150d3b48307b4f0d6871c60151ee25b:
> >>>>>>>>>>>>
> >>>>>>>>>>>>   qcom: venus-5.4: add venus firmware file for qcs615 (2024-11-13 15:50:29 +0530)
> >>>>>>>>>>>>
> >>>>>>>>>>>> ----------------------------------------------------------------
> >>>>>>>>>>>> Renjiang Han (1):
> >>>>>>>>>>>>       qcom: venus-5.4: add venus firmware file for qcs615
> >>>>>>>>>>>>
> >>>>>>>>>>>> WHENCE                      |   1 +
> >>>>>>>>>>>
> >>>>>>>>>>> Could you please be more specific, what is the difference between the
> >>>>>>>>>>> existing file and a new file? According to the soc_vers the new file
> >>>>>>>>>>> supports sdm845. Should it instead replace the old firmware?
> >>>>>>>>>> SDM845, SC7180, qcs615 can be enabled on same firmware ideally, but due to a
> >>>>>>>>>> different signing for qcs615, it takes a separate bin (xxx_s6.mbn).
> >>>>>>>>>
> >>>>>>>>> Can SDM845 handle v6 signatures? It supports v5 and PSS. Or can QCS615
> >>>>>>>>> use v5 signatures?
> >>>>>>>> Infact we started with loading sc7180 firmware on qc615, video init failed. So
> >>>>>>>> far i have seen 2 categories in signing version for video bins, either default
> >>>>>>>> or v6 specific tool.
> >>>>>>>
> >>>>>>> Can firmware / security engineers actually advice us on using v5
> >>>>>>> firmware signatures with QCS615 _and_ with older platforms?
> >>>>>>> Existing venus-5.4/venus.mbn uses v3
> >>>>>>
> >>>>>> Vikash, any updates on this topic? Would it be possible to have a single
> >>>>>> FW image with just v5 signatures?
> >>>>> Not yet Dmitry. Having a followup with relevant folks this friday to understand
> >>>>> the signing requirements across different SOCs, hopefully will be able to add
> >>>>> something on this by then.
> >>>
> >>> It's been more than a week since the last email. Are there any updates?
> >>> I'd really like to get this sorted out before next linux-firmware
> >>> release, otherwise we'll be stuck with these names for the foreseeable
> >>> future.
> >> I have been chasing both the firmware and security folks to align on this. So
> >> far the updates are that one is signed MBNv5 and other with MBNV6, hence leading
> > 
> > I think the existing firmware uses v3, not v5.
> > 
> > 00001000  00 00 00 00 03 00 00 00  00 00 00 00 28 00 a0 0f  |............(...|
> > 
> > 
> >> to different set of binaries. These MBN versions of signing is defined at SOC
> >> level and depends on secure boot libraries used in that SOC.
> >> At the same time, there is an experiment to check if SC7180 can be signed with
> >> version used for QCS615 i.e MBNV6.
> > 
> > Thanks! Are you trying that without updating the whole bootloader stack? I
> > think some of SC7180 devices might be EOL'd, so it might be hard to get
> > FW/bootloader updates.
> Just the firmware part, by signing it with qcs615 way, as an experiment
> suggested by security folks.

Ok, that doesn't sound like a lengthy experiment: resign the FW, boot
the laptop, caboom or not caboom. If I remember correctly the file that
you've pushed even lists sc7180 as allowed.

> 
> >> One query here - given that qcs615 only loads the venus_s6.mbn variant, and it
> >> is not enabled yet (patches in review) for video, we should be good if we
> >> conclude the firmware part before accepting the qcs615 enablement patches ?
> > 
> > Good question. I think that depends on linux-firmware maintainer's
> > opinion.
> > 

-- 
With best wishes
Dmitry

