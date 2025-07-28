Return-Path: <linux-arm-msm+bounces-66882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD1FB13E19
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 17:19:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6349B189FC97
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 15:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2A76272E75;
	Mon, 28 Jul 2025 15:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="FXlezz4/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 004.mia.mailroute.net (004.mia.mailroute.net [199.89.3.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C7B72621;
	Mon, 28 Jul 2025 15:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753715976; cv=none; b=OwShnHzHXiUR1h6PH/bcpftRBN4yQCYT58JR7Hlkpt8wLnvgI72rsqyGNJeal8293w72gQDFpQm0+OtqVBIsjIWa7x26wASzDuVz+cDRAgb0vs8CQ5tXmVJMOwFg4Hbn43NPG81ZMtugqjHc4j8pyA8OIs5cO0w/7wwxg2Ghpzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753715976; c=relaxed/simple;
	bh=wIxcjcNEkyPDjmdkRrJ3cR3fiA648H006TZTC+uVUHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=trqR3C/Lht5RHb0Ww4KCFNP8WByahgVYuSvzRDDu3Nx5fBlHpqB49i457LIiBsPh92ppDHzdg+YOJISRa24PZqiL10dNMWVF0XVUftq2ooDfOoG1HIHRwUNZFhFYC5eEJLSYamvwOa+nqSddSbmxAmBLSsE8DnbEuYGIYJNYtNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=FXlezz4/; arc=none smtp.client-ip=199.89.3.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4brMb44BjHzm0yVN;
	Mon, 28 Jul 2025 15:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1753715965; x=1756307966; bh=wyvxwcIBKz4/1qVBx/Glm6HG
	EcWTzuLIGUB0WKeP3wA=; b=FXlezz4/MQUqElceeHYKDWHaX6UdUZFANqL4A8rM
	d6nTLdhAci116llAi7+noO5nZp2pNaIuRS4uXjQ0bVcAJqJ8yigmkixAmcjTmd2T
	2MqZRJYkoIBmvM4BlvB2VXpq/tCixZBnIK2jIIJQjLFgA5w2K9JybDHLkl7ZsZT4
	xMqxWIrh04vLwcBiW3wW99UhAEozoAyQhZI8Nksa3UHdK+6NlHS7t2A9bY0fYWDW
	xADjqEJ4pDFay50VBT5F4+BU412a3A19QwSMtl2BUURtFmopxBeg300i14kIql8a
	RYPUaZujSxdpHZIVfriBS3LOOHRU4AcUtWp7hYv2hRX7Lg==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id zCbeK2nZy5RL; Mon, 28 Jul 2025 15:19:25 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4brMZp20Ktzm0ySj;
	Mon, 28 Jul 2025 15:19:12 +0000 (UTC)
Message-ID: <c385f1c4-f27b-4dc7-b4a2-d35a9fc77a91@acm.org>
Date: Mon, 28 Jul 2025 08:19:11 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] scsi: ufs: core: move some irq handling back to
 hardirq (with time limit)
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Will McVicker <willmcvicker@google.com>,
 Manivannan Sadhasivam <mani@kernel.org>, kernel-team@android.com,
 linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250725-ufshcd-hardirq-v2-0-884c11e0b0df@linaro.org>
 <20250725-ufshcd-hardirq-v2-2-884c11e0b0df@linaro.org>
 <a008c613-58d6-4368-ae2f-55db4ac82a02@linaro.org>
 <76af97e49cb7f36c8dc6edc62c84e72d6bb4669c.camel@linaro.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <76af97e49cb7f36c8dc6edc62c84e72d6bb4669c.camel@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 7/28/25 7:49 AM, Andr=C3=A9 Draszik wrote:
> Btw, my complete command was (should probably have added that
> to the commit message in the first place):
>=20
> for rw in read write ; do
>      echo "rw: ${rw}"
>      for jobs in 1 8 ; do
>          echo "jobs: ${jobs}"
>          for it in $(seq 1 5) ; do
>              fio --name=3Drand${rw} --rw=3Drand${rw} \
>                  --ioengine=3Dlibaio --direct=3D1 \
>                  --bs=3D4k --numjobs=3D${jobs} --size=3D32m \
>                  --runtime=3D30 --time_based --end_fsync=3D1 \
>                  --group_reporting --filename=3D/foo \
>              | grep -E '(iops|sys=3D|READ:|WRITE:)'
>              sleep 5
>          done
>      done
> done

Please run performance tests in recovery mode against a block
device (/dev/block/sd...) instead of running performance tests on
top of a filesystem. One possible approach for retrieving the block
device name is as follows:

adb shell readlink /dev/block/by-name/userdata

There may be other approaches for retrieving the name of the block
device associated with /data. Additionally, tuning for maximum
performance is useful because it eliminates impact from the process
scheduler on block device performance measurement. An extract from a
scrip that I use myself to measure block device performance on Pixel
devices is available below.

Best regards,

Bart.


optimize() {
     local clkgate_enable c d devfreq disable_cpuidle governor nomerges=20
iostats
     local target_freq ufs_irq_path

     if [ "$1" =3D performance ]; then
	clkgate_enable=3D0
	devfreq=3Dmax
	disable_cpuidle=3D1
	governor=3Dperformance
	# Enable I/O statistics because the performance impact is low and
	# because fio reports the I/O statistics.
	iostats=3D1
	# Disable merging to make tests follow the fio arguments.
	nomerges=3D2
	target_freq=3Dcpuinfo_max_freq
	persist_logs=3Dfalse
     else
	clkgate_enable=3D1
	devfreq=3Dmin
	disable_cpuidle=3D0
	governor=3Dsched_pixel
	iostats=3D1
	nomerges=3D0
	target_freq=3Dcpuinfo_min_freq
	persist_logs=3Dtrue
     fi

     for c in $(adb shell "echo /sys/devices/system/cpu/cpu[0-9]*"); do
	for d in $(adb shell "echo $c/cpuidle/state[1-9]*"); do
	    adb shell "if [ -e $d ]; then echo $disable_cpuidle > $d/disable; fi=
"
	done
	adb shell "cat $c/cpufreq/cpuinfo_max_freq > $c/cpufreq/scaling_max_freq=
;
                    cat $c/cpufreq/${target_freq} >=20
$c/cpufreq/scaling_min_freq;
                    echo ${governor} > $c/cpufreq/scaling_governor; true"=
 \
             2>/dev/null
     done

     if [ "$(adb shell grep -c ufshcd /proc/interrupts)" =3D 1 ]; then
	# No MCQ or MCQ disabled. Make the fastest CPU core process UFS
	# interrupts.
	# shellcheck disable=3DSC2016
	ufs_irq_path=3D$(adb shell 'a=3D$(echo /proc/irq/*/ufshcd); echo ${a%/uf=
shcd}')
	adb shell "echo ${fastest_cpucore} > ${ufs_irq_path}/smp_affinity_list;=20
true"
     else
	# MCQ is enabled. Distribute the completion interrupts over the
	# available CPU cores.
	local i=3D0
	local irqs
	irqs=3D$(adb shell "sed -n 's/:.*GIC.*ufshcd.*//p' /proc/interrupts")
	for irq in $irqs; do
	    adb shell "echo $i > /proc/irq/$irq/smp_affinity_list; true"
	    i=3D$((i+1))
	done
     fi

     for d in $(adb shell echo /sys/class/devfreq/*); do
	case "$d" in
	    *gpu0)
		continue
		;;
	esac
	local min_freq
	min_freq=3D$(adb shell "cat $d/available_frequencies |
		tr ' ' '\n' |
		sort -n |
		case $devfreq in
			min) head -n1;;
			max) tail -n1;;
		esac")
	adb shell "echo $min_freq > $d/min_freq"
	# shellcheck disable=3DSC2086
	if [ "$devfreq" =3D "max" ]; then
	    echo "$(basename $d)/min_freq: $(adb shell cat $d/min_freq) <>=20
$min_freq"
	fi
     done

     for d in $(adb shell echo /sys/devices/platform/*.ufs); do
	adb shell "echo $clkgate_enable > $d/clkgate_enable"
     done

     adb shell setprop logd.logpersistd.enable ${persist_logs}

     adb shell "for b in /sys/class/block/{sd[a-z],dm*}; do
		    if [ -e \$b ]; then
			[ -e \$b/queue/iostats     ] && echo ${iostats}   >\$b/queue/iostats;
			[ -e \$b/queue/nomerges    ] && echo ${nomerges}  >\$b/queue/nomerges;
			[ -e \$b/queue/rq_affinity ] && echo 2            >\$b/queue/rq_affini=
ty;
			[ -e \$b/queue/scheduler   ] && echo ${iosched}   >\$b/queue/scheduler=
;
		    fi
		done; true"

     adb shell "grep -q '^[^[:blank:]]* /sys/kernel/debug' /proc/mounts=20
|| mount -t debugfs none /sys/kernel/debug"
}


