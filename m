Return-Path: <linux-arm-msm+bounces-42997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E039F96A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 17:35:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 690F91886D7D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 16:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B18D1BDAA0;
	Fri, 20 Dec 2024 16:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IlftpR4q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192632EAE4
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 16:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734712448; cv=none; b=G9/MWRkRlka9oHn3n0U/3GWhDQNwvlg2bc9zR1V0IalS06GnUIv+XeHihrJpOnKmQxdr3wIEHA/IqcGIYCJYA/lze2MA/0ZjJ7HC+OdfwIcfw6y+aiU9Cp0I98HzIdXjBDkOzXiCXHy24FcWC7XqHG/4YS/qHvSe1mJzphJXShE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734712448; c=relaxed/simple;
	bh=WLzO8o+Rs8pzVPcsWYuCPjT22UuM4aVjhgiEa8IDNoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UChU8ADrvC2dTaHbMiNyGWSkI1IBO+WeGV67y76NSFj+wJ6LeYNVtn1PdF3CemVWIyY9Idt6VngsCzP6IMk0E9mvI/X7d2JLCbD8EqNOa245eKE87uY2oWKvbM2lgMuCoHY17JO8DDsgN539Bp9OvG13xVWWODlLvIstXnf5jsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IlftpR4q; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4679b5c66d0so264371cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 08:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734712445; x=1735317245; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wgz1pf59HhFQwhX+AoO9GXmTEj308CqbXM6bULf4Lzw=;
        b=IlftpR4qt62M67XaAKvo8y5g937imdSVbcbvETLy/Effss2HUICXS/E/wgG8q/+RBs
         RMrHva62UhFI3UfYxaT4UIbLldM17vdpWtrZHOT4wgOExZxlk2e5TOEFQfZ+YZX8vaRJ
         fojd5TBozsnhwA06lSgwfaLF9qqiDM0huIEm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734712445; x=1735317245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wgz1pf59HhFQwhX+AoO9GXmTEj308CqbXM6bULf4Lzw=;
        b=tCmkHONXzp3cas7q8YlrCLbWWswk64P/S+qUqJtphsBrc+YVHlnbWeaglk2GY1Btk5
         i2GGixju/E7ps7J8vM1swYBB1HhBByIMBQUMJJ1Dj+hKPO/s3h7DPm+dd2R7MkOj2JZp
         R0D8oT0gMLYivN62Sf7gX4Tp/ILW5LZMcaOKnTVtI+N4gf4IYXXQqdviw2hux7UlQP2B
         d5GsxL03wkPUT5V1dB0WzNELFq9mJbTkgMTgItFpPVMpgGXOe59m484ucAdgrTJIhkt1
         JeueByRnbDM4hdL/X0Z2ATyUNvOjValQhkGLVIL9i9ZB3BKkINAeE9EGS2L+BoBHAG/N
         TiVw==
X-Forwarded-Encrypted: i=1; AJvYcCUv+P5fCJX9VVaXzqEOH1emhuwRi3l/VuidfpLfnbBk3ce0aQt6ihc5S2yJct4wN01aiaoLnGdyfmpLOGfE@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe7ltk4Dcur9KGWxT/hgvIATc2gRMno7vVdW8KJo0H2JJ5/Poz
	2NfMpce4tv1EK7u43AXn4j+96Q3RuQHXeWdPW3YyiQTsqS8fHH88JYQSM1No3CBzE60boF5kmG4
	XkKrSaaWdhUkLk6bAynCJ0ioC2e+VSevDu3HZ
X-Gm-Gg: ASbGncv0RmtkdXeBbeRT9fjBabNdgjHJktChKRWtZwh+v5gRGd74dNG66ErcfIDu/49
	Iiof7oivD3x+m1KNjI9Q8JIi7Ubl+rfcWhm6j4e0bcvx4zEdUgnQji6YtUPqPPHTnLX/bMQ==
X-Google-Smtp-Source: AGHT+IEgZZs0znvBuNHG1EZaFB+UIey+thgVWIJFuk5hqk6kjp6faIRhF72ecybWNyHZ7j58TpZIfqHLBIotJLdkotM=
X-Received: by 2002:ac8:5ad0:0:b0:447:e59b:54eb with SMTP id
 d75a77b69052e-46a4a9bebdfmr3988641cf.26.1734712444631; Fri, 20 Dec 2024
 08:34:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241219205426.2275508-1-dianders@chromium.org> <20241219125317.v3.1.I2040fa004dafe196243f67ebcc647cbedbb516e6@changeid>
In-Reply-To: <20241219125317.v3.1.I2040fa004dafe196243f67ebcc647cbedbb516e6@changeid>
From: Julius Werner <jwerner@chromium.org>
Date: Fri, 20 Dec 2024 17:33:53 +0100
Message-ID: <CAODwPW8bq8ev7gb4T=p7GeKsW8Q_7MNY1MpauZ9LOcmH3qVw1A@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] arm64: errata: Assume that unknown CPUs _are_
 vulnerable to Spectre BHB
To: Douglas Anderson <dianders@chromium.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Roxana Bradescu <roxabee@google.com>, 
	Julius Werner <jwerner@chromium.org>, bjorn.andersson@oss.qualcomm.com, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	Jeffrey Hugo <quic_jhugo@quicinc.com>, Trilok Soni <quic_tsoni@quicinc.com>, stable@vger.kernel.org, 
	James Morse <james.morse@arm.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Suren Baghdasaryan <surenb@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Julius Werner <jwerner@chromium.org>

On Thu, Dec 19, 2024 at 9:54=E2=80=AFPM Douglas Anderson <dianders@chromium=
.org> wrote:
>
> The code for detecting CPUs that are vulnerable to Spectre BHB was
> based on a hardcoded list of CPU IDs that were known to be affected.
> Unfortunately, the list mostly only contained the IDs of standard ARM
> cores. The IDs for many cores that are minor variants of the standard
> ARM cores (like many Qualcomm Kyro CPUs) weren't listed. This led the
> code to assume that those variants were not affected.
>
> Flip the code on its head and instead assume that a core is vulnerable
> if it doesn't have CSV2_3 but is unrecognized as being safe. This
> involves creating a "Spectre BHB safe" list.
>
> As of right now, the only CPU IDs added to the "Spectre BHB safe" list
> are ARM Cortex A35, A53, A55, A510, and A520. This list was created by
> looking for cores that weren't listed in ARM's list [1] as per review
> feedback on v2 of this patch [2].
>
> NOTE: this patch will not actually _mitigate_ anyone, it will simply
> cause them to report themselves as vulnerable. If any cores in the
> system are reported as vulnerable but not mitigated then the whole
> system will be reported as vulnerable though the system will attempt
> to mitigate with the information it has about the known cores.
>
> [1] https://developer.arm.com/Arm%20Security%20Center/Spectre-BHB
> [2] https://lore.kernel.org/r/20241219175128.GA25477@willie-the-truck
>
>
> Fixes: 558c303c9734 ("arm64: Mitigate spectre style branch history side c=
hannels")
> Cc: stable@vger.kernel.org
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v3:
> - Don't guess the mitigation; just report unknown cores as vulnerable.
> - Restructure the code since is_spectre_bhb_affected() defaults to true
>
> Changes in v2:
> - New
>
>  arch/arm64/include/asm/spectre.h |   1 -
>  arch/arm64/kernel/proton-pack.c  | 144 +++++++++++++++++--------------
>  2 files changed, 77 insertions(+), 68 deletions(-)
>
> diff --git a/arch/arm64/include/asm/spectre.h b/arch/arm64/include/asm/sp=
ectre.h
> index 0c4d9045c31f..f1524cdeacf1 100644
> --- a/arch/arm64/include/asm/spectre.h
> +++ b/arch/arm64/include/asm/spectre.h
> @@ -97,7 +97,6 @@ enum mitigation_state arm64_get_meltdown_state(void);
>
>  enum mitigation_state arm64_get_spectre_bhb_state(void);
>  bool is_spectre_bhb_affected(const struct arm64_cpu_capabilities *entry,=
 int scope);
> -u8 spectre_bhb_loop_affected(int scope);
>  void spectre_bhb_enable_mitigation(const struct arm64_cpu_capabilities *=
__unused);
>  bool try_emulate_el1_ssbs(struct pt_regs *regs, u32 instr);
>
> diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-p=
ack.c
> index da53722f95d4..06e04c9e6480 100644
> --- a/arch/arm64/kernel/proton-pack.c
> +++ b/arch/arm64/kernel/proton-pack.c
> @@ -845,52 +845,68 @@ static unsigned long system_bhb_mitigations;
>   * This must be called with SCOPE_LOCAL_CPU for each type of CPU, before=
 any
>   * SCOPE_SYSTEM call will give the right answer.
>   */
> -u8 spectre_bhb_loop_affected(int scope)
> +static bool is_spectre_bhb_safe(int scope)
> +{
> +       static const struct midr_range spectre_bhb_safe_list[] =3D {
> +               MIDR_ALL_VERSIONS(MIDR_CORTEX_A35),
> +               MIDR_ALL_VERSIONS(MIDR_CORTEX_A53),
> +               MIDR_ALL_VERSIONS(MIDR_CORTEX_A55),
> +               MIDR_ALL_VERSIONS(MIDR_CORTEX_A510),
> +               MIDR_ALL_VERSIONS(MIDR_CORTEX_A520),
> +               {},
> +       };
> +       static bool all_safe =3D true;
> +
> +       if (scope !=3D SCOPE_LOCAL_CPU)
> +               return all_safe;
> +
> +       if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_safe_list)=
)
> +               return true;
> +
> +       all_safe =3D false;
> +
> +       return false;
> +}
> +
> +static u8 spectre_bhb_loop_affected(void)
>  {
>         u8 k =3D 0;
> -       static u8 max_bhb_k;
> -
> -       if (scope =3D=3D SCOPE_LOCAL_CPU) {
> -               static const struct midr_range spectre_bhb_k32_list[] =3D=
 {
> -                       MIDR_ALL_VERSIONS(MIDR_CORTEX_A78),
> -                       MIDR_ALL_VERSIONS(MIDR_CORTEX_A78AE),
> -                       MIDR_ALL_VERSIONS(MIDR_CORTEX_A78C),
> -                       MIDR_ALL_VERSIONS(MIDR_CORTEX_X1),
> -                       MIDR_ALL_VERSIONS(MIDR_CORTEX_A710),
> -                       MIDR_ALL_VERSIONS(MIDR_CORTEX_X2),
> -                       MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N2),
> -                       MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V1),
> -                       {},
> -               };
> -               static const struct midr_range spectre_bhb_k24_list[] =3D=
 {
> -                       MIDR_ALL_VERSIONS(MIDR_CORTEX_A76),
> -                       MIDR_ALL_VERSIONS(MIDR_CORTEX_A77),
> -                       MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
> -                       {},
> -               };
> -               static const struct midr_range spectre_bhb_k11_list[] =3D=
 {
> -                       MIDR_ALL_VERSIONS(MIDR_AMPERE1),
> -                       {},
> -               };
> -               static const struct midr_range spectre_bhb_k8_list[] =3D =
{
> -                       MIDR_ALL_VERSIONS(MIDR_CORTEX_A72),
> -                       MIDR_ALL_VERSIONS(MIDR_CORTEX_A57),
> -                       {},
> -               };
> -
> -               if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k3=
2_list))
> -                       k =3D 32;
> -               else if (is_midr_in_range_list(read_cpuid_id(), spectre_b=
hb_k24_list))
> -                       k =3D 24;
> -               else if (is_midr_in_range_list(read_cpuid_id(), spectre_b=
hb_k11_list))
> -                       k =3D 11;
> -               else if (is_midr_in_range_list(read_cpuid_id(), spectre_b=
hb_k8_list))
> -                       k =3D  8;
> -
> -               max_bhb_k =3D max(max_bhb_k, k);
> -       } else {
> -               k =3D max_bhb_k;
> -       }
> +
> +       static const struct midr_range spectre_bhb_k32_list[] =3D {
> +               MIDR_ALL_VERSIONS(MIDR_CORTEX_A78),
> +               MIDR_ALL_VERSIONS(MIDR_CORTEX_A78AE),
> +               MIDR_ALL_VERSIONS(MIDR_CORTEX_A78C),
> +               MIDR_ALL_VERSIONS(MIDR_CORTEX_X1),
> +               MIDR_ALL_VERSIONS(MIDR_CORTEX_A710),
> +               MIDR_ALL_VERSIONS(MIDR_CORTEX_X2),
> +               MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N2),
> +               MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V1),
> +               {},
> +       };
> +       static const struct midr_range spectre_bhb_k24_list[] =3D {
> +               MIDR_ALL_VERSIONS(MIDR_CORTEX_A76),
> +               MIDR_ALL_VERSIONS(MIDR_CORTEX_A77),
> +               MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
> +               {},
> +       };
> +       static const struct midr_range spectre_bhb_k11_list[] =3D {
> +               MIDR_ALL_VERSIONS(MIDR_AMPERE1),
> +               {},
> +       };
> +       static const struct midr_range spectre_bhb_k8_list[] =3D {
> +               MIDR_ALL_VERSIONS(MIDR_CORTEX_A72),
> +               MIDR_ALL_VERSIONS(MIDR_CORTEX_A57),
> +               {},
> +       };
> +
> +       if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k32_list))
> +               k =3D 32;
> +       else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k24_l=
ist))
> +               k =3D 24;
> +       else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k11_l=
ist))
> +               k =3D 11;
> +       else if (is_midr_in_range_list(read_cpuid_id(), spectre_bhb_k8_li=
st))
> +               k =3D  8;
>
>         return k;
>  }
> @@ -916,9 +932,8 @@ static enum mitigation_state spectre_bhb_get_cpu_fw_m=
itigation_state(void)
>         }
>  }
>
> -static bool is_spectre_bhb_fw_affected(int scope)
> +static bool is_spectre_bhb_fw_affected(void)
>  {
> -       static bool system_affected;
>         enum mitigation_state fw_state;
>         bool has_smccc =3D arm_smccc_1_1_get_conduit() !=3D SMCCC_CONDUIT=
_NONE;
>         static const struct midr_range spectre_bhb_firmware_mitigated_lis=
t[] =3D {
> @@ -929,16 +944,8 @@ static bool is_spectre_bhb_fw_affected(int scope)
>         bool cpu_in_list =3D is_midr_in_range_list(read_cpuid_id(),
>                                          spectre_bhb_firmware_mitigated_l=
ist);
>
> -       if (scope !=3D SCOPE_LOCAL_CPU)
> -               return system_affected;
> -
>         fw_state =3D spectre_bhb_get_cpu_fw_mitigation_state();
> -       if (cpu_in_list || (has_smccc && fw_state =3D=3D SPECTRE_MITIGATE=
D)) {
> -               system_affected =3D true;
> -               return true;
> -       }
> -
> -       return false;
> +       return cpu_in_list || (has_smccc && fw_state =3D=3D SPECTRE_MITIG=
ATED);
>  }
>
>  static bool supports_ecbhb(int scope)
> @@ -954,6 +961,8 @@ static bool supports_ecbhb(int scope)
>                                                     ID_AA64MMFR1_EL1_ECBH=
B_SHIFT);
>  }
>
> +static u8 max_bhb_k;
> +
>  bool is_spectre_bhb_affected(const struct arm64_cpu_capabilities *entry,
>                              int scope)
>  {
> @@ -962,16 +971,18 @@ bool is_spectre_bhb_affected(const struct arm64_cpu=
_capabilities *entry,
>         if (supports_csv2p3(scope))
>                 return false;
>
> -       if (supports_clearbhb(scope))
> -               return true;
> -
> -       if (spectre_bhb_loop_affected(scope))
> -               return true;
> +       if (is_spectre_bhb_safe(scope))
> +               return false;
>
> -       if (is_spectre_bhb_fw_affected(scope))
> -               return true;
> +       /*
> +        * At this point the core isn't known to be "safe" so we're going=
 to
> +        * assume it's vulnerable. We still need to update `max_bhb_k` th=
ough,
> +        * but only if we aren't mitigating with clearbhb though.
> +        */
> +       if (scope =3D=3D SCOPE_LOCAL_CPU && !supports_clearbhb(SCOPE_LOCA=
L_CPU))
> +               max_bhb_k =3D max(max_bhb_k, spectre_bhb_loop_affected())=
;
>
> -       return false;
> +       return true;
>  }
>
>  static void this_cpu_set_vectors(enum arm64_bp_harden_el1_vectors slot)
> @@ -1028,7 +1039,7 @@ void spectre_bhb_enable_mitigation(const struct arm=
64_cpu_capabilities *entry)
>                 this_cpu_set_vectors(EL1_VECTOR_BHB_CLEAR_INSN);
>                 state =3D SPECTRE_MITIGATED;
>                 set_bit(BHB_INSN, &system_bhb_mitigations);
> -       } else if (spectre_bhb_loop_affected(SCOPE_LOCAL_CPU)) {
> +       } else if (spectre_bhb_loop_affected()) {
>                 /*
>                  * Ensure KVM uses the indirect vector which will have th=
e
>                  * branchy-loop added. A57/A72-r0 will already have selec=
ted
> @@ -1041,7 +1052,7 @@ void spectre_bhb_enable_mitigation(const struct arm=
64_cpu_capabilities *entry)
>                 this_cpu_set_vectors(EL1_VECTOR_BHB_LOOP);
>                 state =3D SPECTRE_MITIGATED;
>                 set_bit(BHB_LOOP, &system_bhb_mitigations);
> -       } else if (is_spectre_bhb_fw_affected(SCOPE_LOCAL_CPU)) {
> +       } else if (is_spectre_bhb_fw_affected()) {
>                 fw_state =3D spectre_bhb_get_cpu_fw_mitigation_state();
>                 if (fw_state =3D=3D SPECTRE_MITIGATED) {
>                         /*
> @@ -1100,7 +1111,6 @@ void noinstr spectre_bhb_patch_loop_iter(struct alt=
_instr *alt,
>  {
>         u8 rd;
>         u32 insn;
> -       u16 loop_count =3D spectre_bhb_loop_affected(SCOPE_SYSTEM);
>
>         BUG_ON(nr_inst !=3D 1); /* MOV -> MOV */
>
> @@ -1109,7 +1119,7 @@ void noinstr spectre_bhb_patch_loop_iter(struct alt=
_instr *alt,
>
>         insn =3D le32_to_cpu(*origptr);
>         rd =3D aarch64_insn_decode_register(AARCH64_INSN_REGTYPE_RD, insn=
);
> -       insn =3D aarch64_insn_gen_movewide(rd, loop_count, 0,
> +       insn =3D aarch64_insn_gen_movewide(rd, max_bhb_k, 0,
>                                          AARCH64_INSN_VARIANT_64BIT,
>                                          AARCH64_INSN_MOVEWIDE_ZERO);
>         *updptr++ =3D cpu_to_le32(insn);
> --
> 2.47.1.613.gc27f4b7a9f-goog
>

